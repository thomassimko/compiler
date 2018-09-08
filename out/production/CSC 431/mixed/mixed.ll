target triple="i686"

%struct.simple = type {i32}
%struct.foo = type {i32, i32, %struct.simple*}
@globalfoo = common global %struct.foo* null, align 8

define void @tailrecursive(i32 %_P_num)
{

L1:
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%r0 = load i32, i32* %num
	%r1 = icmp sle i32 %r0, 0
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L3, label %L4

L3:
	br label %L2
L4:
	br label %L5
L5:
	%r4 = load i32, i32* %num
	%r5 = sub i32 %r4, 1
	call void @tailrecursive(i32 %r5 )
	br label %L2
L2:
	ret void
}

define i32 @add(i32 %_P_x, i32 %_P_y)
{

L7:
	%_retval_ = alloca i32
	%x = alloca i32
	store i32 %_P_x, i32* %x
	%y = alloca i32
	store i32 %_P_y, i32* %y
	%r6 = load i32, i32* %x
	%r7 = load i32, i32* %y
	%r8 = add i32 %r6, %r7
	store i32 %r8, i32* %_retval_
	br label %L8
L8:
	%r9 = load i32, i32* %_retval_
	ret i32 %r9
}

define void @domath(i32 %_P_num)
{

L10:
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%math1 = alloca %struct.foo*
	%math2 = alloca %struct.foo*
	%tmp = alloca i32
	%r10 = call i8* @malloc(i32 24)
	%r11 = bitcast i8* %r10 to %struct.foo*
	store %struct.foo* %r11, %struct.foo** %math1
	%r12 = call i8* @malloc(i32 8)
	%r13 = bitcast i8* %r12 to %struct.simple*
	%r14 = load %struct.foo*, %struct.foo** %math1
	%r15 = getelementptr %struct.foo , %struct.foo* %r14, i1 0, i32 2
	store %struct.simple* %r13, %struct.simple** %r15
	%r16 = call i8* @malloc(i32 24)
	%r17 = bitcast i8* %r16 to %struct.foo*
	store %struct.foo* %r17, %struct.foo** %math2
	%r18 = call i8* @malloc(i32 8)
	%r19 = bitcast i8* %r18 to %struct.simple*
	%r20 = load %struct.foo*, %struct.foo** %math2
	%r21 = getelementptr %struct.foo , %struct.foo* %r20, i1 0, i32 2
	store %struct.simple* %r19, %struct.simple** %r21
	%r22 = load i32, i32* %num
	%r23 = load %struct.foo*, %struct.foo** %math1
	%r24 = getelementptr %struct.foo , %struct.foo* %r23, i1 0, i32 0
	store i32 %r22, i32* %r24
	%r25 = load %struct.foo*, %struct.foo** %math2
	%r26 = getelementptr %struct.foo , %struct.foo* %r25, i1 0, i32 0
	store i32 3, i32* %r26
	%r27 = load %struct.foo*, %struct.foo** %math1
	%r28 = getelementptr %struct.foo , %struct.foo* %r27, i1 0, i32 0
	%r29 = load i32, i32* %r28
	%r30 = load %struct.foo*, %struct.foo** %math1
	%r31 = getelementptr %struct.foo , %struct.foo* %r30, i1 0, i32 2
	%r32 = load %struct.simple*, %struct.simple** %r31
	%r33 = getelementptr %struct.simple , %struct.simple* %r32, i1 0, i32 0
	store i32 %r29, i32* %r33
	%r34 = load %struct.foo*, %struct.foo** %math2
	%r35 = getelementptr %struct.foo , %struct.foo* %r34, i1 0, i32 0
	%r36 = load i32, i32* %r35
	%r37 = load %struct.foo*, %struct.foo** %math2
	%r38 = getelementptr %struct.foo , %struct.foo* %r37, i1 0, i32 2
	%r39 = load %struct.simple*, %struct.simple** %r38
	%r40 = getelementptr %struct.simple , %struct.simple* %r39, i1 0, i32 0
	store i32 %r36, i32* %r40
	%r41 = load i32, i32* %num
	%r42 = icmp sgt i32 %r41, 0
	%r43 = zext i1 %r42 to i32
	%r44 = trunc i32 %r43 to i1
	br i1 %r44, label %L12, label %L13

L12:
	%r45 = load %struct.foo*, %struct.foo** %math1
	%r46 = getelementptr %struct.foo , %struct.foo* %r45, i1 0, i32 0
	%r47 = load i32, i32* %r46
	%r48 = load %struct.foo*, %struct.foo** %math2
	%r49 = getelementptr %struct.foo , %struct.foo* %r48, i1 0, i32 0
	%r50 = load i32, i32* %r49
	%r51 = mul i32 %r47, %r50
	store i32 %r51, i32* %tmp
	%r52 = load i32, i32* %tmp
	%r53 = load %struct.foo*, %struct.foo** %math1
	%r54 = getelementptr %struct.foo , %struct.foo* %r53, i1 0, i32 2
	%r55 = load %struct.simple*, %struct.simple** %r54
	%r56 = getelementptr %struct.simple , %struct.simple* %r55, i1 0, i32 0
	%r57 = load i32, i32* %r56
	%r58 = mul i32 %r52, %r57
	%r59 = load %struct.foo*, %struct.foo** %math2
	%r60 = getelementptr %struct.foo , %struct.foo* %r59, i1 0, i32 0
	%r61 = load i32, i32* %r60
	%r62 = sdiv i32 %r58, %r61
	store i32 %r62, i32* %tmp
	%r63 = load %struct.foo*, %struct.foo** %math2
	%r64 = getelementptr %struct.foo , %struct.foo* %r63, i1 0, i32 2
	%r65 = load %struct.simple*, %struct.simple** %r64
	%r66 = getelementptr %struct.simple , %struct.simple* %r65, i1 0, i32 0
	%r67 = load i32, i32* %r66
	%r68 = load %struct.foo*, %struct.foo** %math1
	%r69 = getelementptr %struct.foo , %struct.foo* %r68, i1 0, i32 0
	%r70 = load i32, i32* %r69
	%r71 = call i32 @add(i32 %r67, i32 %r70 )
	store i32 %r71, i32* %tmp
	%r72 = load %struct.foo*, %struct.foo** %math2
	%r73 = getelementptr %struct.foo , %struct.foo* %r72, i1 0, i32 0
	%r74 = load i32, i32* %r73
	%r75 = load %struct.foo*, %struct.foo** %math1
	%r76 = getelementptr %struct.foo , %struct.foo* %r75, i1 0, i32 0
	%r77 = load i32, i32* %r76
	%r78 = sub i32 %r74, %r77
	store i32 %r78, i32* %tmp
	%r79 = load i32, i32* %num
	%r80 = sub i32 %r79, 1
	store i32 %r80, i32* %num
	%r81 = load i32, i32* %num
	%r82 = icmp sgt i32 %r81, 0
	%r83 = zext i1 %r82 to i32
	%r84 = trunc i32 %r83 to i1
	br i1 %r84, label %L12, label %L13

L13:
	%r86 = load %struct.foo*, %struct.foo** %math1
	%r85 = bitcast %struct.foo* %r86 to i8*
	call void @free(i8* %r85 )
	%r88 = load %struct.foo*, %struct.foo** %math2
	%r87 = bitcast %struct.foo* %r88 to i8*
	call void @free(i8* %r87 )
	br label %L11
L11:
	ret void
}

define void @objinstantiation(i32 %_P_num)
{

L15:
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%tmp = alloca %struct.foo*
	%r89 = load i32, i32* %num
	%r90 = icmp sgt i32 %r89, 0
	%r91 = zext i1 %r90 to i32
	%r92 = trunc i32 %r91 to i1
	br i1 %r92, label %L17, label %L18

L17:
	%r93 = call i8* @malloc(i32 24)
	%r94 = bitcast i8* %r93 to %struct.foo*
	store %struct.foo* %r94, %struct.foo** %tmp
	%r96 = load %struct.foo*, %struct.foo** %tmp
	%r95 = bitcast %struct.foo* %r96 to i8*
	call void @free(i8* %r95 )
	%r97 = load i32, i32* %num
	%r98 = sub i32 %r97, 1
	store i32 %r98, i32* %num
	%r99 = load i32, i32* %num
	%r100 = icmp sgt i32 %r99, 0
	%r101 = zext i1 %r100 to i32
	%r102 = trunc i32 %r101 to i1
	br i1 %r102, label %L17, label %L18

L18:
	br label %L16
L16:
	ret void
}

define i32 @ackermann(i32 %_P_m, i32 %_P_n)
{

L20:
	%_retval_ = alloca i32
	%m = alloca i32
	store i32 %_P_m, i32* %m
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%r103 = load i32, i32* %m
	%r104 = icmp eq i32 %r103, 0
	%r105 = zext i1 %r104 to i32
	%r106 = trunc i32 %r105 to i1
	br i1 %r106, label %L22, label %L23

L22:
	%r107 = load i32, i32* %n
	%r108 = add i32 %r107, 1
	store i32 %r108, i32* %_retval_
	br label %L21
L23:
	br label %L24
L24:
	%r110 = load i32, i32* %n
	%r111 = icmp eq i32 %r110, 0
	%r112 = zext i1 %r111 to i32
	%r113 = trunc i32 %r112 to i1
	br i1 %r113, label %L25, label %L26

L25:
	%r114 = load i32, i32* %m
	%r115 = sub i32 %r114, 1
	%r116 = call i32 @ackermann(i32 %r115, i32 1 )
	store i32 %r116, i32* %_retval_
	br label %L21
L26:
	%r118 = load i32, i32* %m
	%r119 = sub i32 %r118, 1
	%r120 = load i32, i32* %m
	%r121 = load i32, i32* %n
	%r122 = sub i32 %r121, 1
	%r123 = call i32 @ackermann(i32 %r120, i32 %r122 )
	%r124 = call i32 @ackermann(i32 %r119, i32 %r123 )
	store i32 %r124, i32* %_retval_
	br label %L21
L21:
	%r109 = load i32, i32* %_retval_
	ret i32 %r109
}

define i32 @main()
{

L29:
	%_retval_ = alloca i32
	%a = alloca i32
	%b = alloca i32
	%c = alloca i32
	%d = alloca i32
	%e = alloca i32
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r126 = load i32, i32* @.read_scratch
	store i32 %r126, i32* %a
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r127 = load i32, i32* @.read_scratch
	store i32 %r127, i32* %b
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r128 = load i32, i32* @.read_scratch
	store i32 %r128, i32* %c
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r129 = load i32, i32* @.read_scratch
	store i32 %r129, i32* %d
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r130 = load i32, i32* @.read_scratch
	store i32 %r130, i32* %e
	%r131 = load i32, i32* %a
	call void @tailrecursive(i32 %r131 )
	%r132 = load i32, i32* %a
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r132)
	%r133 = load i32, i32* %b
	call void @domath(i32 %r133 )
	%r134 = load i32, i32* %b
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r134)
	%r135 = load i32, i32* %c
	call void @objinstantiation(i32 %r135 )
	%r136 = load i32, i32* %c
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r136)
	%r137 = load i32, i32* %d
	%r138 = load i32, i32* %e
	%r139 = call i32 @ackermann(i32 %r137, i32 %r138 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r139)
	store i32 0, i32* %_retval_
	br label %L30
L30:
	%r140 = load i32, i32* %_retval_
	ret i32 %r140
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8