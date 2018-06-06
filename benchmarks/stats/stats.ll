target triple="i686"

%struct.linkedNums = type {%struct.linkedNums*, i32}

define %struct.linkedNums* @getRands(i32 %seed, i32 %num)
{

L1:
	%r0 = mul i32 %seed, %seed
	%r1 = call i8* @malloc(i32 16)
	%r2 = bitcast i8* %r1 to %struct.linkedNums*
	%r3 = getelementptr %struct.linkedNums , %struct.linkedNums* %r2, i1 0, i32 1
	store i32 %r0, i32* %r3
	%r4 = getelementptr %struct.linkedNums , %struct.linkedNums* %r2, i1 0, i32 0
	store %struct.linkedNums* null, %struct.linkedNums** %r4
	%r5 = sub i32 %num, 1
	%r6 = icmp sgt i32 %r5, 0
	%r7 = zext i1 %r6 to i32
	%r8 = trunc i32 %r7 to i1
	br i1 %r8, label %L3, label %L4

L3:
	%r9 = phi i32 [%r0, %L1], [%r15, %L3]
	%r11 = phi i32 [%seed, %L1], [%r11, %L3]
	%r19 = phi %struct.linkedNums* [%r2, %L1], [%r17, %L3]
	%r21 = phi i32 [%r5, %L1], [%r22, %L3]
	%r10 = mul i32 %r9, %r9
	%r12 = sdiv i32 %r10, %r11
	%r13 = sdiv i32 %r11, 2
	%r14 = mul i32 %r12, %r13
	%r15 = add i32 %r14, 1
	%r16 = call i8* @malloc(i32 16)
	%r17 = bitcast i8* %r16 to %struct.linkedNums*
	%r18 = getelementptr %struct.linkedNums , %struct.linkedNums* %r17, i1 0, i32 1
	store i32 %r15, i32* %r18
	%r20 = getelementptr %struct.linkedNums , %struct.linkedNums* %r17, i1 0, i32 0
	store %struct.linkedNums* %r19, %struct.linkedNums** %r20
	%r22 = sub i32 %r21, 1
	%r23 = icmp sgt i32 %r22, 0
	%r24 = zext i1 %r23 to i32
	%r25 = trunc i32 %r24 to i1
	br i1 %r25, label %L3, label %L4

L4:
	%r26 = phi %struct.linkedNums* [null, %L1], [%r17, %L3]
	br label %L2
L2:
	ret %struct.linkedNums* %r26
}

define i32 @calcMean(%struct.linkedNums* %nums)
{

L6:
	%r28 = icmp ne %struct.linkedNums* %nums, null
	%r29 = zext i1 %r28 to i32
	%r30 = trunc i32 %r29 to i1
	br i1 %r30, label %L8, label %L9

L8:
	%r31 = phi i32 [0, %L6], [%r32, %L8]
	%r33 = phi i32 [0, %L6], [%r37, %L8]
	%r34 = phi %struct.linkedNums* [%nums, %L6], [%r39, %L8]
	%r51 = phi i32 [0, %L6], [0, %L8]
	%r32 = add i32 %r31, 1
	%r35 = getelementptr %struct.linkedNums , %struct.linkedNums* %r34, i1 0, i32 1
	%r36 = load i32, i32* %r35
	%r37 = add i32 %r33, %r36
	%r38 = getelementptr %struct.linkedNums , %struct.linkedNums* %r34, i1 0, i32 0
	%r39 = load %struct.linkedNums*, %struct.linkedNums** %r38
	%r40 = icmp ne %struct.linkedNums* %r39, null
	%r41 = zext i1 %r40 to i32
	%r42 = trunc i32 %r41 to i1
	br i1 %r42, label %L8, label %L9

L9:
	%r43 = phi i32 [0, %L6], [%r32, %L8]
	%r47 = phi i32 [0, %L6], [%r37, %L8]
	%r50 = phi i32 [0, %L6], [0, %L8]
	%r44 = icmp ne i32 %r43, 0
	%r45 = zext i1 %r44 to i32
	%r46 = trunc i32 %r45 to i1
	br i1 %r46, label %L10, label %L11

L10:
	%r48 = sdiv i32 %r47, %r43
	br label %L12
L11:
	br label %L12
L12:
	%r49 = phi i32 [%r48, %L10], [0, %L11]
	br label %L7
L7:
	ret i32 %r49
}

define i32 @approxSqrt(i32 %num)
{

L14:
	%r53 = icmp slt i32 0, %num
	%r54 = zext i1 %r53 to i32
	%r55 = trunc i32 %r54 to i1
	br i1 %r55, label %L16, label %L17

L16:
	%r56 = phi i32 [1, %L14], [%r58, %L16]
	%r59 = phi i32 [%num, %L14], [%r59, %L16]
	%r57 = mul i32 %r56, %r56
	%r58 = add i32 %r56, 1
	%r60 = icmp slt i32 %r57, %r59
	%r61 = zext i1 %r60 to i32
	%r62 = trunc i32 %r61 to i1
	br i1 %r62, label %L16, label %L17

L17:
	%r63 = phi i32 [1, %L14], [%r56, %L16]
	br label %L15
L15:
	ret i32 %r63
}

define void @approxSqrtAll(%struct.linkedNums* %nums)
{

L19:
	%r65 = icmp ne %struct.linkedNums* %nums, null
	%r66 = zext i1 %r65 to i32
	%r67 = trunc i32 %r66 to i1
	br i1 %r67, label %L21, label %L22

L21:
	%r68 = phi %struct.linkedNums* [%nums, %L19], [%r73, %L21]
	%r69 = getelementptr %struct.linkedNums , %struct.linkedNums* %r68, i1 0, i32 1
	%r70 = load i32, i32* %r69
	%r71 = call i32 @approxSqrt(i32 %r70 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r71)
	%r72 = getelementptr %struct.linkedNums , %struct.linkedNums* %r68, i1 0, i32 0
	%r73 = load %struct.linkedNums*, %struct.linkedNums** %r72
	%r74 = icmp ne %struct.linkedNums* %r73, null
	%r75 = zext i1 %r74 to i32
	%r76 = trunc i32 %r75 to i1
	br i1 %r76, label %L21, label %L22

L22:
	br label %L20
L20:
	ret void
}

define void @range(%struct.linkedNums* %nums)
{

L24:
	%r77 = zext i1 1 to i32
	%r78 = icmp ne %struct.linkedNums* %nums, null
	%r79 = zext i1 %r78 to i32
	%r80 = trunc i32 %r79 to i1
	br i1 %r80, label %L26, label %L27

L26:
	%r81 = phi i32 [1, %L24], [%r113, %L30]
	%r83 = phi %struct.linkedNums* [%nums, %L24], [%r109, %L30]
	%r91 = phi i32 [0, %L24], [%r116, %L30]
	%r99 = phi i32 [0, %L24], [%r119, %L30]
	%r82 = trunc i32 %r81 to i1
	br i1 %r82, label %L28, label %L29

L28:
	%r84 = getelementptr %struct.linkedNums , %struct.linkedNums* %r83, i1 0, i32 1
	%r85 = load i32, i32* %r84
	%r86 = getelementptr %struct.linkedNums , %struct.linkedNums* %r83, i1 0, i32 1
	%r87 = load i32, i32* %r86
	%r88 = zext i1 0 to i32
	br label %L30
L29:
	%r89 = getelementptr %struct.linkedNums , %struct.linkedNums* %r83, i1 0, i32 1
	%r90 = load i32, i32* %r89
	%r92 = icmp slt i32 %r90, %r91
	%r93 = zext i1 %r92 to i32
	%r94 = trunc i32 %r93 to i1
	br i1 %r94, label %L31, label %L32

L30:
	%r105 = phi %struct.linkedNums* [%r83, %L28], [%r106, %L33]
	%r113 = phi i32 [0, %L28], [%r114, %L33]
	%r116 = phi i32 [%r85, %L28], [%r117, %L33]
	%r119 = phi i32 [%r87, %L28], [%r120, %L33]
	%r108 = getelementptr %struct.linkedNums , %struct.linkedNums* %r105, i1 0, i32 0
	%r109 = load %struct.linkedNums*, %struct.linkedNums** %r108
	%r110 = icmp ne %struct.linkedNums* %r109, null
	%r111 = zext i1 %r110 to i32
	%r112 = trunc i32 %r111 to i1
	br i1 %r112, label %L26, label %L27

L31:
	%r95 = getelementptr %struct.linkedNums , %struct.linkedNums* %r83, i1 0, i32 1
	%r96 = load i32, i32* %r95
	br label %L33
L32:
	%r97 = getelementptr %struct.linkedNums , %struct.linkedNums* %r83, i1 0, i32 1
	%r98 = load i32, i32* %r97
	%r100 = icmp sgt i32 %r98, %r99
	%r101 = zext i1 %r100 to i32
	%r102 = trunc i32 %r101 to i1
	br i1 %r102, label %L34, label %L35

L33:
	%r106 = phi %struct.linkedNums* [%r83, %L31], [%r107, %L36]
	%r114 = phi i32 [%r81, %L31], [%r115, %L36]
	%r117 = phi i32 [%r96, %L31], [%r118, %L36]
	%r120 = phi i32 [%r99, %L31], [%r121, %L36]
	br label %L30
L34:
	%r103 = getelementptr %struct.linkedNums , %struct.linkedNums* %r83, i1 0, i32 1
	%r104 = load i32, i32* %r103
	br label %L36
L35:
	br label %L36
L36:
	%r107 = phi %struct.linkedNums* [%r83, %L34], [%r83, %L35]
	%r115 = phi i32 [%r81, %L34], [%r81, %L35]
	%r118 = phi i32 [%r91, %L34], [%r91, %L35]
	%r121 = phi i32 [%r104, %L34], [%r99, %L35]
	br label %L33
L27:
	%r122 = phi i32 [0, %L24], [%r116, %L30]
	%r123 = phi i32 [0, %L24], [%r119, %L30]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r122)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r123)
	br label %L25
L25:
	ret void
}

define i32 @main()
{

L38:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r124 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r125 = load i32, i32* @.read_scratch
	%r126 = call %struct.linkedNums* @getRands(i32 %r124, i32 %r125 )
	%r127 = call i32 @calcMean(%struct.linkedNums* %r126 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r127)
	call void @range(%struct.linkedNums* %r126 )
	call void @approxSqrtAll(%struct.linkedNums* %r126 )
	br label %L39
L39:
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