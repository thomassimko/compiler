target triple="i686"

%struct.simple = type {i32}
%struct.foo = type {i32, i32, %struct.simple*}
@globalfoo = common global %struct.foo* null, align 8

define void @tailrecursive(i32 %num)
{

L1:
	%r0 = icmp sle i32 %num, 0
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	br label %L2
L4:
	br label %L5
L5:
	%r3 = sub i32 %num, 1
	call void @tailrecursive(i32 %r3 )
	br label %L2
L2:
	ret void
}

define void @domath(i32 %num)
{

L10:
	%r6 = call i8* @malloc(i32 24)
	%r7 = bitcast i8* %r6 to %struct.foo*
	%r8 = call i8* @malloc(i32 8)
	%r9 = bitcast i8* %r8 to %struct.simple*
	%r10 = getelementptr %struct.foo , %struct.foo* %r7, i1 0, i32 2
	store %struct.simple* %r9, %struct.simple** %r10
	%r11 = call i8* @malloc(i32 24)
	%r12 = bitcast i8* %r11 to %struct.foo*
	%r13 = call i8* @malloc(i32 8)
	%r14 = bitcast i8* %r13 to %struct.simple*
	%r15 = getelementptr %struct.foo , %struct.foo* %r12, i1 0, i32 2
	store %struct.simple* %r14, %struct.simple** %r15
	%r16 = getelementptr %struct.foo , %struct.foo* %r7, i1 0, i32 0
	store i32 %num, i32* %r16
	%r17 = getelementptr %struct.foo , %struct.foo* %r12, i1 0, i32 0
	store i32 3, i32* %r17
	%r18 = getelementptr %struct.foo , %struct.foo* %r7, i1 0, i32 0
	%r19 = load i32, i32* %r18
	%r20 = getelementptr %struct.foo , %struct.foo* %r7, i1 0, i32 2
	%r21 = load %struct.simple*, %struct.simple** %r20
	%r22 = getelementptr %struct.simple , %struct.simple* %r21, i1 0, i32 0
	store i32 %r19, i32* %r22
	%r23 = getelementptr %struct.foo , %struct.foo* %r12, i1 0, i32 0
	%r24 = load i32, i32* %r23
	%r25 = getelementptr %struct.foo , %struct.foo* %r12, i1 0, i32 2
	%r26 = load %struct.simple*, %struct.simple** %r25
	%r27 = getelementptr %struct.simple , %struct.simple* %r26, i1 0, i32 0
	store i32 %r24, i32* %r27
	%r28 = icmp sgt i32 %num, 0
	%r29 = zext i1 %r28 to i32
	%r30 = trunc i32 %r29 to i1
	br i1 %r30, label %L12, label %L13

L12:
	%r31 = phi %struct.foo* [%r7, %L10], [%r31, %L12]
	%r34 = phi %struct.foo* [%r12, %L10], [%r34, %L12]
	%r58 = phi i32 [%num, %L10], [%r59, %L12]
	%r59 = sub i32 %r58, 1
	%r60 = icmp sgt i32 %r59, 0
	%r61 = zext i1 %r60 to i32
	%r62 = trunc i32 %r61 to i1
	br i1 %r62, label %L12, label %L13

L13:
	%r64 = phi %struct.foo* [%r7, %L10], [%r31, %L12]
	%r66 = phi %struct.foo* [%r12, %L10], [%r34, %L12]
	%r63 = bitcast %struct.foo* %r64 to i8*
	call void @free(i8* %r63 )
	%r65 = bitcast %struct.foo* %r66 to i8*
	call void @free(i8* %r65 )
	br label %L11
L11:
	ret void
}

define void @objinstantiation(i32 %num)
{

L15:
	%r67 = icmp sgt i32 %num, 0
	%r68 = zext i1 %r67 to i32
	%r69 = trunc i32 %r68 to i1
	br i1 %r69, label %L17, label %L18

L17:
	%r73 = phi i32 [%num, %L15], [%r74, %L17]
	%r70 = call i8* @malloc(i32 24)
	%r71 = bitcast i8* %r70 to %struct.foo*
	%r72 = bitcast %struct.foo* %r71 to i8*
	call void @free(i8* %r72 )
	%r74 = sub i32 %r73, 1
	%r75 = icmp sgt i32 %r74, 0
	%r76 = zext i1 %r75 to i32
	%r77 = trunc i32 %r76 to i1
	br i1 %r77, label %L17, label %L18

L18:
	br label %L16
L16:
	ret void
}

define i32 @ackermann(i32 %m, i32 %n)
{

L20:
	%r78 = icmp eq i32 %m, 0
	%r79 = zext i1 %r78 to i32
	%r80 = trunc i32 %r79 to i1
	br i1 %r80, label %L22, label %L23

L22:
	%r81 = add i32 %n, 1
	br label %L21
L23:
	br label %L24
L24:
	%r82 = icmp eq i32 %n, 0
	%r83 = zext i1 %r82 to i32
	%r84 = trunc i32 %r83 to i1
	br i1 %r84, label %L25, label %L26

L25:
	%r85 = sub i32 %m, 1
	%r86 = call i32 @ackermann(i32 %r85, i32 1 )
	br label %L21
L26:
	%r87 = sub i32 %m, 1
	%r88 = sub i32 %n, 1
	%r89 = call i32 @ackermann(i32 %m, i32 %r88 )
	%r90 = call i32 @ackermann(i32 %r87, i32 %r89 )
	br label %L21
L21:
	%r91 = phi i32 [%r81, %L22], [%r86, %L25], [%r90, %L26]
	ret i32 %r91
}

define i32 @main()
{

L29:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r92 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r93 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r94 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r95 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r96 = load i32, i32* @.read_scratch
	call void @tailrecursive(i32 %r92 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r92)
	call void @domath(i32 %r93 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r93)
	call void @objinstantiation(i32 %r94 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r94)
	%r97 = call i32 @ackermann(i32 %r95, i32 %r96 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r97)
	br label %L30
L30:
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