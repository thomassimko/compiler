target triple="i686"

%struct.linkedNums = type {%struct.linkedNums*, i32}

define %struct.linkedNums* @getRands(i32 %_P_seed, i32 %_P_num)
{

L1:
	%_retval_ = alloca %struct.linkedNums*
	%seed = alloca i32
	store i32 %_P_seed, i32* %seed
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%cur = alloca i32
	%prev = alloca i32
	%curNode = alloca %struct.linkedNums*
	%prevNode = alloca %struct.linkedNums*
	store %struct.linkedNums* null, %struct.linkedNums** %curNode
	%r0 = load i32, i32* %seed
	%r1 = load i32, i32* %seed
	%r2 = mul i32 %r0, %r1
	store i32 %r2, i32* %cur
	%r3 = call i8* @malloc(i32 16)
	%r4 = bitcast i8* %r3 to %struct.linkedNums*
	store %struct.linkedNums* %r4, %struct.linkedNums** %prevNode
	%r5 = load i32, i32* %cur
	%r6 = load %struct.linkedNums*, %struct.linkedNums** %prevNode
	%r7 = getelementptr %struct.linkedNums , %struct.linkedNums* %r6, i1 0, i32 1
	store i32 %r5, i32* %r7
	%r8 = load %struct.linkedNums*, %struct.linkedNums** %prevNode
	%r9 = getelementptr %struct.linkedNums , %struct.linkedNums* %r8, i1 0, i32 0
	store %struct.linkedNums* null, %struct.linkedNums** %r9
	%r10 = load i32, i32* %num
	%r11 = sub i32 %r10, 1
	store i32 %r11, i32* %num
	%r12 = load i32, i32* %cur
	store i32 %r12, i32* %prev
	%r13 = load i32, i32* %num
	%r14 = icmp sgt i32 %r13, 0
	%r15 = zext i1 %r14 to i32
	%r16 = trunc i32 %r15 to i1
	br i1 %r16, label %L3, label %L4

L3:
	%r17 = load i32, i32* %prev
	%r18 = load i32, i32* %prev
	%r19 = mul i32 %r17, %r18
	%r20 = load i32, i32* %seed
	%r21 = sdiv i32 %r19, %r20
	%r22 = load i32, i32* %seed
	%r23 = sdiv i32 %r22, 2
	%r24 = mul i32 %r21, %r23
	%r25 = add i32 %r24, 1
	store i32 %r25, i32* %cur
	%r26 = call i8* @malloc(i32 16)
	%r27 = bitcast i8* %r26 to %struct.linkedNums*
	store %struct.linkedNums* %r27, %struct.linkedNums** %curNode
	%r28 = load i32, i32* %cur
	%r29 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	%r30 = getelementptr %struct.linkedNums , %struct.linkedNums* %r29, i1 0, i32 1
	store i32 %r28, i32* %r30
	%r31 = load %struct.linkedNums*, %struct.linkedNums** %prevNode
	%r32 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	%r33 = getelementptr %struct.linkedNums , %struct.linkedNums* %r32, i1 0, i32 0
	store %struct.linkedNums* %r31, %struct.linkedNums** %r33
	%r34 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	store %struct.linkedNums* %r34, %struct.linkedNums** %prevNode
	%r35 = load i32, i32* %num
	%r36 = sub i32 %r35, 1
	store i32 %r36, i32* %num
	%r37 = load i32, i32* %cur
	store i32 %r37, i32* %prev
	%r38 = load i32, i32* %num
	%r39 = icmp sgt i32 %r38, 0
	%r40 = zext i1 %r39 to i32
	%r41 = trunc i32 %r40 to i1
	br i1 %r41, label %L3, label %L4

L4:
	%r42 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	store %struct.linkedNums* %r42, %struct.linkedNums** %_retval_
	br label %L2
L2:
	%r43 = load %struct.linkedNums*, %struct.linkedNums** %_retval_
	ret %struct.linkedNums* %r43
}

define i32 @calcMean(%struct.linkedNums* %_P_nums)
{

L6:
	%_retval_ = alloca i32
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %_P_nums, %struct.linkedNums** %nums
	%sum = alloca i32
	%num = alloca i32
	%mean = alloca i32
	store i32 0, i32* %sum
	store i32 0, i32* %num
	store i32 0, i32* %mean
	%r44 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r45 = icmp ne %struct.linkedNums* %r44, null
	%r46 = zext i1 %r45 to i32
	%r47 = trunc i32 %r46 to i1
	br i1 %r47, label %L8, label %L9

L8:
	%r48 = load i32, i32* %num
	%r49 = add i32 %r48, 1
	store i32 %r49, i32* %num
	%r50 = load i32, i32* %sum
	%r51 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r52 = getelementptr %struct.linkedNums , %struct.linkedNums* %r51, i1 0, i32 1
	%r53 = load i32, i32* %r52
	%r54 = add i32 %r50, %r53
	store i32 %r54, i32* %sum
	%r55 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r56 = getelementptr %struct.linkedNums , %struct.linkedNums* %r55, i1 0, i32 0
	%r57 = load %struct.linkedNums*, %struct.linkedNums** %r56
	store %struct.linkedNums* %r57, %struct.linkedNums** %nums
	%r58 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r59 = icmp ne %struct.linkedNums* %r58, null
	%r60 = zext i1 %r59 to i32
	%r61 = trunc i32 %r60 to i1
	br i1 %r61, label %L8, label %L9

L9:
	%r62 = load i32, i32* %num
	%r63 = icmp ne i32 %r62, 0
	%r64 = zext i1 %r63 to i32
	%r65 = trunc i32 %r64 to i1
	br i1 %r65, label %L10, label %L11

L10:
	%r66 = load i32, i32* %sum
	%r67 = load i32, i32* %num
	%r68 = sdiv i32 %r66, %r67
	store i32 %r68, i32* %mean
	br label %L12
L11:
	br label %L12
L12:
	%r69 = load i32, i32* %mean
	store i32 %r69, i32* %_retval_
	br label %L7
L7:
	%r70 = load i32, i32* %_retval_
	ret i32 %r70
}

define i32 @approxSqrt(i32 %_P_num)
{

L14:
	%_retval_ = alloca i32
	%num = alloca i32
	store i32 %_P_num, i32* %num
	%guess = alloca i32
	%result = alloca i32
	%prev = alloca i32
	store i32 1, i32* %guess
	%r71 = load i32, i32* %guess
	store i32 %r71, i32* %prev
	store i32 0, i32* %result
	%r72 = load i32, i32* %result
	%r73 = load i32, i32* %num
	%r74 = icmp slt i32 %r72, %r73
	%r75 = zext i1 %r74 to i32
	%r76 = trunc i32 %r75 to i1
	br i1 %r76, label %L16, label %L17

L16:
	%r77 = load i32, i32* %guess
	%r78 = load i32, i32* %guess
	%r79 = mul i32 %r77, %r78
	store i32 %r79, i32* %result
	%r80 = load i32, i32* %guess
	store i32 %r80, i32* %prev
	%r81 = load i32, i32* %guess
	%r82 = add i32 %r81, 1
	store i32 %r82, i32* %guess
	%r83 = load i32, i32* %result
	%r84 = load i32, i32* %num
	%r85 = icmp slt i32 %r83, %r84
	%r86 = zext i1 %r85 to i32
	%r87 = trunc i32 %r86 to i1
	br i1 %r87, label %L16, label %L17

L17:
	%r88 = load i32, i32* %prev
	store i32 %r88, i32* %_retval_
	br label %L15
L15:
	%r89 = load i32, i32* %_retval_
	ret i32 %r89
}

define void @approxSqrtAll(%struct.linkedNums* %_P_nums)
{

L19:
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %_P_nums, %struct.linkedNums** %nums
	%r90 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r91 = icmp ne %struct.linkedNums* %r90, null
	%r92 = zext i1 %r91 to i32
	%r93 = trunc i32 %r92 to i1
	br i1 %r93, label %L21, label %L22

L21:
	%r94 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r95 = getelementptr %struct.linkedNums , %struct.linkedNums* %r94, i1 0, i32 1
	%r96 = load i32, i32* %r95
	%r97 = call i32 @approxSqrt(i32 %r96 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r97)
	%r98 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r99 = getelementptr %struct.linkedNums , %struct.linkedNums* %r98, i1 0, i32 0
	%r100 = load %struct.linkedNums*, %struct.linkedNums** %r99
	store %struct.linkedNums* %r100, %struct.linkedNums** %nums
	%r101 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r102 = icmp ne %struct.linkedNums* %r101, null
	%r103 = zext i1 %r102 to i32
	%r104 = trunc i32 %r103 to i1
	br i1 %r104, label %L21, label %L22

L22:
	br label %L20
L20:
	ret void
}

define void @range(%struct.linkedNums* %_P_nums)
{

L24:
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %_P_nums, %struct.linkedNums** %nums
	%min = alloca i32
	%max = alloca i32
	%first = alloca i32
	store i32 0, i32* %min
	store i32 0, i32* %max
	%r105 = zext i1 1 to i32
	store i32 %r105, i32* %first
	%r106 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r107 = icmp ne %struct.linkedNums* %r106, null
	%r108 = zext i1 %r107 to i32
	%r109 = trunc i32 %r108 to i1
	br i1 %r109, label %L26, label %L27

L26:
	%r110 = load i32, i32* %first
	%r111 = trunc i32 %r110 to i1
	br i1 %r111, label %L28, label %L29

L28:
	%r112 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r113 = getelementptr %struct.linkedNums , %struct.linkedNums* %r112, i1 0, i32 1
	%r114 = load i32, i32* %r113
	store i32 %r114, i32* %min
	%r115 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r116 = getelementptr %struct.linkedNums , %struct.linkedNums* %r115, i1 0, i32 1
	%r117 = load i32, i32* %r116
	store i32 %r117, i32* %max
	%r118 = zext i1 0 to i32
	store i32 %r118, i32* %first
	br label %L30
L29:
	%r119 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r120 = getelementptr %struct.linkedNums , %struct.linkedNums* %r119, i1 0, i32 1
	%r121 = load i32, i32* %r120
	%r122 = load i32, i32* %min
	%r123 = icmp slt i32 %r121, %r122
	%r124 = zext i1 %r123 to i32
	%r125 = trunc i32 %r124 to i1
	br i1 %r125, label %L31, label %L32

L30:
	%r139 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r140 = getelementptr %struct.linkedNums , %struct.linkedNums* %r139, i1 0, i32 0
	%r141 = load %struct.linkedNums*, %struct.linkedNums** %r140
	store %struct.linkedNums* %r141, %struct.linkedNums** %nums
	%r142 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r143 = icmp ne %struct.linkedNums* %r142, null
	%r144 = zext i1 %r143 to i32
	%r145 = trunc i32 %r144 to i1
	br i1 %r145, label %L26, label %L27

L31:
	%r126 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r127 = getelementptr %struct.linkedNums , %struct.linkedNums* %r126, i1 0, i32 1
	%r128 = load i32, i32* %r127
	store i32 %r128, i32* %min
	br label %L33
L32:
	%r129 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r130 = getelementptr %struct.linkedNums , %struct.linkedNums* %r129, i1 0, i32 1
	%r131 = load i32, i32* %r130
	%r132 = load i32, i32* %max
	%r133 = icmp sgt i32 %r131, %r132
	%r134 = zext i1 %r133 to i32
	%r135 = trunc i32 %r134 to i1
	br i1 %r135, label %L34, label %L35

L33:
	br label %L30
L34:
	%r136 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r137 = getelementptr %struct.linkedNums , %struct.linkedNums* %r136, i1 0, i32 1
	%r138 = load i32, i32* %r137
	store i32 %r138, i32* %max
	br label %L36
L35:
	br label %L36
L36:
	br label %L33
L27:
	%r146 = load i32, i32* %min
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r146)
	%r147 = load i32, i32* %max
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r147)
	br label %L25
L25:
	ret void
}

define i32 @main()
{

L38:
	%_retval_ = alloca i32
	%seed = alloca i32
	%num = alloca i32
	%mean = alloca i32
	%nums = alloca %struct.linkedNums*
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r148 = load i32, i32* @.read_scratch
	store i32 %r148, i32* %seed
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r149 = load i32, i32* @.read_scratch
	store i32 %r149, i32* %num
	%r150 = load i32, i32* %seed
	%r151 = load i32, i32* %num
	%r152 = call %struct.linkedNums* @getRands(i32 %r150, i32 %r151 )
	store %struct.linkedNums* %r152, %struct.linkedNums** %nums
	%r153 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r154 = call i32 @calcMean(%struct.linkedNums* %r153 )
	store i32 %r154, i32* %mean
	%r155 = load i32, i32* %mean
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r155)
	%r156 = load %struct.linkedNums*, %struct.linkedNums** %nums
	call void @range(%struct.linkedNums* %r156 )
	%r157 = load %struct.linkedNums*, %struct.linkedNums** %nums
	call void @approxSqrtAll(%struct.linkedNums* %r157 )
	store i32 0, i32* %_retval_
	br label %L39
L39:
	%r158 = load i32, i32* %_retval_
	ret i32 %r158
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8