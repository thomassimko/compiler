target triple="i686"

%struct.simple = type {i32}
%struct.foo = type {i32, i32, %struct.simple*}
@globalfoo = common global %struct.foo* null, align 8

define void @tailrecursive(i32 %_P_num)
{

L2:
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%r0 = load i32* %num
	%r1 = icmp sle i32 %r0, 0
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L4, label %L5

L4:
	br label %L3
L5:
	br label %L6
L6:
	%r4 = load i32* %num
	%r5 = sub i32 %r4, 1
	call void @tailrecursive(i32 %r5 )
	br label %L3
L3:
	ret void
}

define i32 @add(i32 %_P_x, i32 %_P_y)
{

L9:
	%_retval_ = alloca i32
	%x = alloca i32
	store i32 %_P_x, i32* %x
	%y = alloca i32
	store i32 %_P_y, i32* %y
	%r6 = load i32* %x
	%r7 = load i32* %y
	%r8 = add i32 %r6, %r7
	store i32 %r8, i32* %_retval_
	br label %L10
L10:
	%r9 = load i32* %_retval_
	ret i32 %r9
}

define void @domath(i32 %_P_num)
{

L12:
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%math1 = alloca %struct.foo*
	%math2 = alloca %struct.foo*
	%tmp = alloca i32
	%r10 = call i8* @malloc(i32 24)
	%r11 = bitcast i8* %r10 to %struct.foo*
	store %struct.foo* %r11, %struct.foo** %math1
	%r12 = load %struct.foo** %math1
	%r13 = getelementptr %struct.foo* %r12, i1 0, i32 2
	%r14 = call i8* @malloc(i32 8)
	%r15 = bitcast i8* %r14 to %struct.simple*
	store %struct.simple* %r15, %struct.simple** %r13
	%r16 = call i8* @malloc(i32 24)
	%r17 = bitcast i8* %r16 to %struct.foo*
	store %struct.foo* %r17, %struct.foo** %math2
	%r18 = load %struct.foo** %math2
	%r19 = getelementptr %struct.foo* %r18, i1 0, i32 2
	%r20 = call i8* @malloc(i32 8)
	%r21 = bitcast i8* %r20 to %struct.simple*
	store %struct.simple* %r21, %struct.simple** %r19
	%r22 = load %struct.foo** %math1
	%r23 = getelementptr %struct.foo* %r22, i1 0, i32 0
	%r24 = load i32* %num
	store i32 %r24, i32* %r23
	%r25 = load %struct.foo** %math2
	%r26 = getelementptr %struct.foo* %r25, i1 0, i32 0
	store i32 3, i32* %r26
	%r27 = load %struct.foo** %math1
	%r28 = getelementptr %struct.foo* %r27, i1 0, i32 2
	%r29 = load %struct.simple** %r28
	%r30 = getelementptr %struct.simple* %r29, i1 0, i32 0
	%r31 = load %struct.foo** %math1
	%r32 = getelementptr %struct.foo* %r31, i1 0, i32 0
	%r33 = load i32* %r32
	store i32 %r33, i32* %r30
	%r34 = load %struct.foo** %math2
	%r35 = getelementptr %struct.foo* %r34, i1 0, i32 2
	%r36 = load %struct.simple** %r35
	%r37 = getelementptr %struct.simple* %r36, i1 0, i32 0
	%r38 = load %struct.foo** %math2
	%r39 = getelementptr %struct.foo* %r38, i1 0, i32 0
	%r40 = load i32* %r39
	store i32 %r40, i32* %r37
	%r77 = load i32* %num
	%r78 = icmp sgt i32 %r77, 0
	%r79 = zext i1 %r78 to i32
	%r80 = trunc i32 %r79 to i1
	br i1 %r80, label %L14, label %L15

L14:
	%r41 = load %struct.foo** %math1
	%r42 = getelementptr %struct.foo* %r41, i1 0, i32 0
	%r43 = load i32* %r42
	%r44 = load %struct.foo** %math2
	%r45 = getelementptr %struct.foo* %r44, i1 0, i32 0
	%r46 = load i32* %r45
	%r47 = mul i32 %r43, %r46
	store i32 %r47, i32* %tmp
	%r48 = load i32* %tmp
	%r49 = load %struct.foo** %math1
	%r50 = getelementptr %struct.foo* %r49, i1 0, i32 2
	%r51 = load %struct.simple** %r50
	%r52 = getelementptr %struct.simple* %r51, i1 0, i32 0
	%r53 = load i32* %r52
	%r54 = mul i32 %r48, %r53
	%r55 = load %struct.foo** %math2
	%r56 = getelementptr %struct.foo* %r55, i1 0, i32 0
	%r57 = load i32* %r56
	%r58 = sdiv i32 %r54, %r57
	store i32 %r58, i32* %tmp
	%r59 = load %struct.foo** %math2
	%r60 = getelementptr %struct.foo* %r59, i1 0, i32 2
	%r61 = load %struct.simple** %r60
	%r62 = getelementptr %struct.simple* %r61, i1 0, i32 0
	%r63 = load i32* %r62
	%r64 = load %struct.foo** %math1
	%r65 = getelementptr %struct.foo* %r64, i1 0, i32 0
	%r66 = load i32* %r65
	%r67 = call i32 @add(i32 %r63, i32 %r66 )
	store i32 %r67, i32* %tmp
	%r68 = load %struct.foo** %math2
	%r69 = getelementptr %struct.foo* %r68, i1 0, i32 0
	%r70 = load i32* %r69
	%r71 = load %struct.foo** %math1
	%r72 = getelementptr %struct.foo* %r71, i1 0, i32 0
	%r73 = load i32* %r72
	%r74 = sub i32 %r70, %r73
	store i32 %r74, i32* %tmp
	%r75 = load i32* %num
	%r76 = sub i32 %r75, 1
	store i32 %r76, i32* %num
	%r81 = load i32* %num
	%r82 = icmp sgt i32 %r81, 0
	%r83 = zext i1 %r82 to i32
	%r84 = trunc i32 %r83 to i1
	br i1 %r84, label %L14, label %L15

L15:
	%r86 = load %struct.foo** %math1
	%r85 = bitcast %struct.foo* %r86 to i8*
	call void @free(i8* %r85 )
	%r88 = load %struct.foo** %math2
	%r87 = bitcast %struct.foo* %r88 to i8*
	call void @free(i8* %r87 )
	br label %L13
L13:
	ret void
}

define void @objinstantiation(i32 %_P_num)
{

L17:
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%tmp = alloca %struct.foo*
	%r95 = load i32* %num
	%r96 = icmp sgt i32 %r95, 0
	%r97 = zext i1 %r96 to i32
	%r98 = trunc i32 %r97 to i1
	br i1 %r98, label %L19, label %L20

L19:
	%r89 = call i8* @malloc(i32 24)
	%r90 = bitcast i8* %r89 to %struct.foo*
	store %struct.foo* %r90, %struct.foo** %tmp
	%r92 = load %struct.foo** %tmp
	%r91 = bitcast %struct.foo* %r92 to i8*
	call void @free(i8* %r91 )
	%r93 = load i32* %num
	%r94 = sub i32 %r93, 1
	store i32 %r94, i32* %num
	%r99 = load i32* %num
	%r100 = icmp sgt i32 %r99, 0
	%r101 = zext i1 %r100 to i32
	%r102 = trunc i32 %r101 to i1
	br i1 %r102, label %L19, label %L20

L20:
	br label %L18
L18:
	ret void
}

define i32 @ackermann(i32 %_P_m, i32 %_P_n)
{

L22:
	%_retval_ = alloca i32
	%m = alloca i32
	store i32 %_P_m, i32* %m
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%r103 = load i32* %m
	%r104 = icmp eq i32 %r103, 0
	%r105 = zext i1 %r104 to i32
	%r106 = trunc i32 %r105 to i1
	br i1 %r106, label %L24, label %L25

L24:
	%r107 = load i32* %n
	%r108 = add i32 %r107, 1
	store i32 %r108, i32* %_retval_
	br label %L23
L25:
	br label %L26
L26:
	%r110 = load i32* %n
	%r111 = icmp eq i32 %r110, 0
	%r112 = zext i1 %r111 to i32
	%r113 = trunc i32 %r112 to i1
	br i1 %r113, label %L28, label %L29

L28:
	%r114 = load i32* %m
	%r115 = sub i32 %r114, 1
	%r116 = call i32 @ackermann(i32 %r115, i32 1 )
	store i32 %r116, i32* %_retval_
	br label %L23
L29:
	%r118 = load i32* %m
	%r119 = sub i32 %r118, 1
	%r120 = load i32* %m
	%r121 = load i32* %n
	%r122 = sub i32 %r121, 1
	%r123 = call i32 @ackermann(i32 %r120, i32 %r122 )
	%r124 = call i32 @ackermann(i32 %r119, i32 %r123 )
	store i32 %r124, i32* %_retval_
	br label %L23
L30:
	br label %L23
L23:
	%r109 = load i32* %_retval_
	ret i32 %r109
}

define i32 @main()
{

L34:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i32* %a)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i32* %b)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i32* %c)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i32* %d)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i32* %e)
	%r126 = load i32* %a
	call void @tailrecursive(i32 %r126 )
	%r127 = load i32* %a
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r127)
	%r128 = load i32* %b
	call void @domath(i32 %r128 )
	%r129 = load i32* %b
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r129)
	%r130 = load i32* %c
	call void @objinstantiation(i32 %r130 )
	%r131 = load i32* %c
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r131)
	%r132 = load i32* %d
	%r133 = load i32* %e
	%r134 = call i32 @ackermann(i32 %r132, i32 %r133 )
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r134)
	store i32 0, i32* %_retval_
	br label %L35
L35:
	%r135 = load i32* %_retval_
	ret i32 %r135
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8