target triple="i686"

@global1 = common global i32 0, align 8
@global2 = common global i32 0, align 8
@global3 = common global i32 0, align 8

define i32 @sum(i32 %number)
{

L10:
	%r76 = icmp sgt i32 %number, 0
	%r77 = zext i1 %r76 to i32
	%r78 = trunc i32 %r77 to i1
	br i1 %r78, label %L12, label %L13

L12:
	%r79 = phi i32 [0, %L10], [%r81, %L12]
	%r80 = phi i32 [%number, %L10], [%r82, %L12]
	%r81 = add i32 %r79, %r80
	%r82 = sub i32 %r80, 1
	%r83 = icmp sgt i32 %r82, 0
	%r84 = zext i1 %r83 to i32
	%r85 = trunc i32 %r84 to i1
	br i1 %r85, label %L12, label %L13

L13:
	%r86 = phi i32 [0, %L10], [%r81, %L12]
	br label %L11
L11:
	ret i32 %r86
}

define i32 @doesntModifyGlobals()
{

L15:
	br label %L16
L16:
	ret i32 3
}

define i32 @interProceduralOptimization()
{

L18:
	store i32 1, i32* @global1
	store i32 0, i32* @global2
	store i32 0, i32* @global3
	%r90 = call i32 @sum(i32 100 )
	%r91 = load i32, i32* @global1
	%r92 = icmp eq i32 %r91, 1
	%r93 = zext i1 %r92 to i32
	%r94 = trunc i32 %r93 to i1
	br i1 %r94, label %L20, label %L21

L20:
	%r95 = call i32 @sum(i32 10000 )
	br label %L22
L21:
	%r96 = load i32, i32* @global2
	%r97 = icmp eq i32 %r96, 2
	%r98 = zext i1 %r97 to i32
	%r99 = trunc i32 %r98 to i1
	br i1 %r99, label %L23, label %L24

L22:
	%r106 = phi i32 [%r95, %L20], [%r107, %L28]
	br label %L19
L23:
	%r100 = call i32 @sum(i32 20000 )
	br label %L25
L24:
	br label %L25
L25:
	%r108 = phi i32 [%r100, %L23], [%r90, %L24]
	%r101 = load i32, i32* @global3
	%r102 = icmp eq i32 %r101, 3
	%r103 = zext i1 %r102 to i32
	%r104 = trunc i32 %r103 to i1
	br i1 %r104, label %L26, label %L27

L26:
	%r105 = call i32 @sum(i32 30000 )
	br label %L28
L27:
	br label %L28
L28:
	%r107 = phi i32 [%r105, %L26], [%r108, %L27]
	br label %L22
L19:
	ret i32 %r106
}

define i32 @hoisting()
{

L33:
	br i1 1, label %L35, label %L36

L35:
	%r246 = phi i32 [0, %L33], [%r247, %L35]
	%r247 = add i32 %r246, 1
	%r248 = icmp slt i32 %r247, 1000000
	%r249 = zext i1 %r248 to i32
	%r250 = trunc i32 %r249 to i1
	br i1 %r250, label %L35, label %L36

L36:
	br label %L34
L34:
	ret i32 2
}

define i32 @doubleIf()
{

L38:
	br i1 1, label %L40, label %L41

L40:
	br i1 1, label %L43, label %L44

L41:
	br label %L42
L42:
	%r259 = phi i32 [50, %L45], [0, %L41]
	br label %L39
L43:
	br label %L45
L44:
	br label %L45
L45:
	br label %L42
L39:
	ret i32 %r259
}

define i32 @tailRecursionHelper(i32 %value, i32 %sum)
{

L53:
	%r281 = icmp eq i32 %value, 0
	%r282 = zext i1 %r281 to i32
	%r283 = trunc i32 %r282 to i1
	br i1 %r283, label %L55, label %L56

L55:
	br label %L54
L56:
	%r284 = sub i32 %value, 1
	%r285 = add i32 %sum, %value
	%r286 = call i32 @tailRecursionHelper(i32 %r284, i32 %r285 )
	br label %L54
L54:
	%r287 = phi i32 [%sum, %L55], [%r286, %L56]
	ret i32 %r287
}

define i32 @unswitching()
{

L62:
	br i1 1, label %L64, label %L65

L64:
	%r297 = phi i32 [1, %L62], [%r300, %L68]
	br i1 1, label %L66, label %L67

L66:
	%r298 = add i32 %r297, 1
	br label %L68
L67:
	%r299 = add i32 %r297, 2
	br label %L68
L68:
	%r300 = phi i32 [%r298, %L66], [%r299, %L67]
	%r301 = icmp slt i32 %r300, 1000000
	%r302 = zext i1 %r301 to i32
	%r303 = trunc i32 %r302 to i1
	br i1 %r303, label %L64, label %L65

L65:
	%r305 = phi i32 [1, %L62], [%r300, %L68]
	br label %L63
L63:
	ret i32 %r305
}

define i32 @randomCalculation(i32 %number)
{

L70:
	%r307 = icmp slt i32 0, %number
	%r308 = zext i1 %r307 to i32
	%r309 = trunc i32 %r308 to i1
	br i1 %r309, label %L72, label %L73

L72:
	%r312 = phi i32 [0, %L70], [%r313, %L72]
	%r314 = phi i32 [0, %L70], [%r321, %L72]
	%r322 = phi i32 [%number, %L70], [%r322, %L72]
	%r313 = add i32 %r312, 19
	%r315 = mul i32 %r314, 2
	%r316 = sdiv i32 %r315, 2
	%r317 = mul i32 3, %r316
	%r318 = sdiv i32 %r317, 3
	%r319 = mul i32 %r318, 4
	%r320 = sdiv i32 %r319, 4
	%r321 = add i32 %r320, 1
	%r323 = icmp slt i32 %r321, %r322
	%r324 = zext i1 %r323 to i32
	%r325 = trunc i32 %r324 to i1
	br i1 %r325, label %L72, label %L73

L73:
	%r326 = phi i32 [0, %L70], [%r313, %L72]
	br label %L71
L71:
	ret i32 %r326
}

define i32 @iterativeFibonacci(i32 %number)
{

L75:
	%r328 = sub i32 0, 1
	%r329 = icmp slt i32 0, %number
	%r330 = zext i1 %r329 to i32
	%r331 = trunc i32 %r330 to i1
	br i1 %r331, label %L77, label %L78

L77:
	%r332 = phi i32 [1, %L75], [%r334, %L77]
	%r333 = phi i32 [-1, %L75], [%r332, %L77]
	%r335 = phi i32 [0, %L75], [%r336, %L77]
	%r337 = phi i32 [%number, %L75], [%r337, %L77]
	%r334 = add i32 %r332, %r333
	%r336 = add i32 %r335, 1
	%r338 = icmp slt i32 %r336, %r337
	%r339 = zext i1 %r338 to i32
	%r340 = trunc i32 %r339 to i1
	br i1 %r340, label %L77, label %L78

L78:
	%r341 = phi i32 [1, %L75], [%r334, %L77]
	br label %L76
L76:
	ret i32 %r341
}

define i32 @recursiveFibonacci(i32 %number)
{

L80:
	%r343 = icmp sle i32 %number, 0
	%r344 = zext i1 %r343 to i32
	%r345 = icmp eq i32 %number, 1
	%r346 = zext i1 %r345 to i32
	%r347 = or i32 %r344, %r346
	%r348 = trunc i32 %r347 to i1
	br i1 %r348, label %L82, label %L83

L82:
	br label %L81
L83:
	%r349 = sub i32 %number, 1
	%r350 = call i32 @recursiveFibonacci(i32 %r349 )
	%r351 = sub i32 %number, 2
	%r352 = call i32 @recursiveFibonacci(i32 %r351 )
	%r353 = add i32 %r350, %r352
	br label %L81
L81:
	%r354 = phi i32 [%number, %L82], [%r353, %L83]
	ret i32 %r354
}

define i32 @main()
{

L86:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r355 = load i32, i32* @.read_scratch
	%r356 = icmp slt i32 1, %r355
	%r357 = zext i1 %r356 to i32
	%r358 = trunc i32 %r357 to i1
	br i1 %r358, label %L88, label %L89

L88:
	%r368 = phi i32 [%r355, %L86], [%r368, %L88]
	%r377 = phi i32 [1, %L86], [%r378, %L88]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 226)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -25457889)
	store i32 11, i32* @global1
	store i32 5, i32* @global1
	store i32 9, i32* @global1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 38)
	%r362 = call i32 @interProceduralOptimization()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r362)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 -48796)
	%r364 = call i32 @hoisting()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r364)
	%r365 = call i32 @doubleIf()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r365)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 736)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 10)
	%r369 = sdiv i32 %r368, 1000
	%r288 = call i32 @tailRecursionHelper(i32 %r369, i32 0 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r288)
	%r371 = call i32 @unswitching()
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r371)
	%r372 = call i32 @randomCalculation(i32 %r368 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r372)
	%r373 = sdiv i32 %r368, 5
	%r374 = call i32 @iterativeFibonacci(i32 %r373 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r374)
	%r375 = sdiv i32 %r368, 1000
	%r376 = call i32 @recursiveFibonacci(i32 %r375 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r376)
	%r378 = add i32 %r377, 1
	%r379 = icmp slt i32 %r378, %r368
	%r380 = zext i1 %r379 to i32
	%r381 = trunc i32 %r380 to i1
	br i1 %r381, label %L88, label %L89

L89:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 9999)
	br label %L87
L87:
	ret i32 0
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8