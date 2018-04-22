target triple="i686"

%struct.linkedNums = type {%struct.linkedNums*, i32}

define %struct.linkedNums* @getRands(i32 %_P_seed, i32 %_P_num)
{

L2:
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
	%r5 = load %struct.linkedNums*, %struct.linkedNums** %prevNode
	%r6 = getelementptr %struct.linkedNums , %struct.linkedNums* %r5, i1 0, i32 1
	%r7 = load i32, i32* %cur
	store i32 %r7, i32* %r6
	%r8 = load %struct.linkedNums*, %struct.linkedNums** %prevNode
	%r9 = getelementptr %struct.linkedNums , %struct.linkedNums* %r8, i1 0, i32 0
	store %struct.linkedNums* null, %struct.linkedNums** %r9
	%r10 = load i32, i32* %num
	%r11 = sub i32 %r10, 1
	store i32 %r11, i32* %num
	%r12 = load i32, i32* %cur
	store i32 %r12, i32* %prev
	%r34 = load i32, i32* %num
	%r35 = icmp sgt i32 %r34, 0
	%r36 = zext i1 %r35 to i32
	%r37 = trunc i32 %r36 to i1
	br i1 %r37, label %L4, label %L5

L4:
	%r13 = load i32, i32* %prev
	%r14 = load i32, i32* %prev
	%r15 = mul i32 %r13, %r14
	%r16 = load i32, i32* %seed
	%r17 = sdiv i32 %r15, %r16
	%r18 = load i32, i32* %seed
	%r19 = sdiv i32 %r18, 2
	%r20 = mul i32 %r17, %r19
	%r21 = add i32 %r20, 1
	store i32 %r21, i32* %cur
	%r22 = call i8* @malloc(i32 16)
	%r23 = bitcast i8* %r22 to %struct.linkedNums*
	store %struct.linkedNums* %r23, %struct.linkedNums** %curNode
	%r24 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	%r25 = getelementptr %struct.linkedNums , %struct.linkedNums* %r24, i1 0, i32 1
	%r26 = load i32, i32* %cur
	store i32 %r26, i32* %r25
	%r27 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	%r28 = getelementptr %struct.linkedNums , %struct.linkedNums* %r27, i1 0, i32 0
	%r29 = load %struct.linkedNums*, %struct.linkedNums** %prevNode
	store %struct.linkedNums* %r29, %struct.linkedNums** %r28
	%r30 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	store %struct.linkedNums* %r30, %struct.linkedNums** %prevNode
	%r31 = load i32, i32* %num
	%r32 = sub i32 %r31, 1
	store i32 %r32, i32* %num
	%r33 = load i32, i32* %cur
	store i32 %r33, i32* %prev
	%r38 = load i32, i32* %num
	%r39 = icmp sgt i32 %r38, 0
	%r40 = zext i1 %r39 to i32
	%r41 = trunc i32 %r40 to i1
	br i1 %r41, label %L4, label %L5

L5:
	%r42 = load %struct.linkedNums*, %struct.linkedNums** %curNode
	store %struct.linkedNums* %r42, %struct.linkedNums** %_retval_
	br label %L3
L3:
	%r43 = load %struct.linkedNums*, %struct.linkedNums** %_retval_
	ret %struct.linkedNums* %r43
}

define i32 @calcMean(%struct.linkedNums* %_P_nums)
{

L7:
	%_retval_ = alloca i32
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %_P_nums, %struct.linkedNums** %nums
	%sum = alloca i32
	%num = alloca i32
	%mean = alloca i32
	store i32 0, i32* %sum
	store i32 0, i32* %num
	store i32 0, i32* %mean
	%r54 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r55 = icmp ne %struct.linkedNums* %r54, null
	%r56 = zext i1 %r55 to i32
	%r57 = trunc i32 %r56 to i1
	br i1 %r57, label %L9, label %L10

L9:
	%r44 = load i32, i32* %num
	%r45 = add i32 %r44, 1
	store i32 %r45, i32* %num
	%r46 = load i32, i32* %sum
	%r47 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r48 = getelementptr %struct.linkedNums , %struct.linkedNums* %r47, i1 0, i32 1
	%r49 = load i32, i32* %r48
	%r50 = add i32 %r46, %r49
	store i32 %r50, i32* %sum
	%r51 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r52 = getelementptr %struct.linkedNums , %struct.linkedNums* %r51, i1 0, i32 0
	%r53 = load %struct.linkedNums*, %struct.linkedNums** %r52
	store %struct.linkedNums* %r53, %struct.linkedNums** %nums
	%r58 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r59 = icmp ne %struct.linkedNums* %r58, null
	%r60 = zext i1 %r59 to i32
	%r61 = trunc i32 %r60 to i1
	br i1 %r61, label %L9, label %L10

L10:
	%r62 = load i32, i32* %num
	%r63 = icmp ne i32 %r62, 0
	%r64 = zext i1 %r63 to i32
	%r65 = trunc i32 %r64 to i1
	br i1 %r65, label %L11, label %L12

L11:
	%r66 = load i32, i32* %sum
	%r67 = load i32, i32* %num
	%r68 = sdiv i32 %r66, %r67
	store i32 %r68, i32* %mean
	br label %L13
L12:
	br label %L13
L13:
	%r69 = load i32, i32* %mean
	store i32 %r69, i32* %_retval_
	br label %L8
L8:
	%r70 = load i32, i32* %_retval_
	ret i32 %r70
}

define i32 @approxSqrt(i32 %_P_num)
{

L15:
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
	%r78 = load i32, i32* %result
	%r79 = load i32, i32* %num
	%r80 = icmp slt i32 %r78, %r79
	%r81 = zext i1 %r80 to i32
	%r82 = trunc i32 %r81 to i1
	br i1 %r82, label %L17, label %L18

L17:
	%r72 = load i32, i32* %guess
	%r73 = load i32, i32* %guess
	%r74 = mul i32 %r72, %r73
	store i32 %r74, i32* %result
	%r75 = load i32, i32* %guess
	store i32 %r75, i32* %prev
	%r76 = load i32, i32* %guess
	%r77 = add i32 %r76, 1
	store i32 %r77, i32* %guess
	%r83 = load i32, i32* %result
	%r84 = load i32, i32* %num
	%r85 = icmp slt i32 %r83, %r84
	%r86 = zext i1 %r85 to i32
	%r87 = trunc i32 %r86 to i1
	br i1 %r87, label %L17, label %L18

L18:
	%r88 = load i32, i32* %prev
	store i32 %r88, i32* %_retval_
	br label %L16
L16:
	%r89 = load i32, i32* %_retval_
	ret i32 %r89
}

define void @approxSqrtAll(%struct.linkedNums* %_P_nums)
{

L20:
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %_P_nums, %struct.linkedNums** %nums
	%r97 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r98 = icmp ne %struct.linkedNums* %r97, null
	%r99 = zext i1 %r98 to i32
	%r100 = trunc i32 %r99 to i1
	br i1 %r100, label %L22, label %L23

L22:
	%r90 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r91 = getelementptr %struct.linkedNums , %struct.linkedNums* %r90, i1 0, i32 1
	%r92 = load i32, i32* %r91
	%r93 = call i32 @approxSqrt(i32 %r92 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r93)
	%r94 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r95 = getelementptr %struct.linkedNums , %struct.linkedNums* %r94, i1 0, i32 0
	%r96 = load %struct.linkedNums*, %struct.linkedNums** %r95
	store %struct.linkedNums* %r96, %struct.linkedNums** %nums
	%r101 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r102 = icmp ne %struct.linkedNums* %r101, null
	%r103 = zext i1 %r102 to i32
	%r104 = trunc i32 %r103 to i1
	br i1 %r104, label %L22, label %L23

L23:
	br label %L21
L21:
	ret void
}

define void @range(%struct.linkedNums* %_P_nums)
{

L25:
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %_P_nums, %struct.linkedNums** %nums
	%min = alloca i32
	%max = alloca i32
	%first = alloca i32
	store i32 0, i32* %min
	store i32 0, i32* %max
	%r105 = zext i1 1 to i32
	store i32 %r105, i32* %first
	%r138 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r139 = icmp ne %struct.linkedNums* %r138, null
	%r140 = zext i1 %r139 to i32
	%r141 = trunc i32 %r140 to i1
	br i1 %r141, label %L27, label %L37

L28:
	%r108 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r109 = getelementptr %struct.linkedNums , %struct.linkedNums* %r108, i1 0, i32 1
	%r110 = load i32, i32* %r109
	store i32 %r110, i32* %min
	%r111 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r112 = getelementptr %struct.linkedNums , %struct.linkedNums* %r111, i1 0, i32 1
	%r113 = load i32, i32* %r112
	store i32 %r113, i32* %max
	%r114 = zext i1 0 to i32
	store i32 %r114, i32* %first
	br label %L30
L29:
	%r115 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r116 = getelementptr %struct.linkedNums , %struct.linkedNums* %r115, i1 0, i32 1
	%r117 = load i32, i32* %r116
	%r118 = load i32, i32* %min
	%r119 = icmp slt i32 %r117, %r118
	%r120 = zext i1 %r119 to i32
	%r121 = trunc i32 %r120 to i1
	br i1 %r121, label %L31, label %L32

L30:
	%r135 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r136 = getelementptr %struct.linkedNums , %struct.linkedNums* %r135, i1 0, i32 0
	%r137 = load %struct.linkedNums*, %struct.linkedNums** %r136
	store %struct.linkedNums* %r137, %struct.linkedNums** %nums
	%r142 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r143 = icmp ne %struct.linkedNums* %r142, null
	%r144 = zext i1 %r143 to i32
	%r145 = trunc i32 %r144 to i1
	br i1 %r145, label %L27, label %L37

L31:
	%r122 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r123 = getelementptr %struct.linkedNums , %struct.linkedNums* %r122, i1 0, i32 1
	%r124 = load i32, i32* %r123
	store i32 %r124, i32* %min
	br label %L33
L32:
	%r125 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r126 = getelementptr %struct.linkedNums , %struct.linkedNums* %r125, i1 0, i32 1
	%r127 = load i32, i32* %r126
	%r128 = load i32, i32* %max
	%r129 = icmp sgt i32 %r127, %r128
	%r130 = zext i1 %r129 to i32
	%r131 = trunc i32 %r130 to i1
	br i1 %r131, label %L34, label %L35

L33:
	br label %L30
L34:
	%r132 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r133 = getelementptr %struct.linkedNums , %struct.linkedNums* %r132, i1 0, i32 1
	%r134 = load i32, i32* %r133
	store i32 %r134, i32* %max
	br label %L36
L35:
	br label %L36
L36:
	br label %L33
L27:
	%r106 = load i32, i32* %first
	%r107 = trunc i32 %r106 to i1
	br i1 %r107, label %L28, label %L29

L37:
	%r146 = load i32, i32* %min
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r146)
	%r147 = load i32, i32* %max
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r147)
	br label %L26
L26:
	ret void
}

define i32 @main()
{

L39:
	%_retval_ = alloca i32
	%seed = alloca i32
	%num = alloca i32
	%mean = alloca i32
	%nums = alloca %struct.linkedNums*
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %seed)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %num)
	%r148 = load i32, i32* %seed
	%r149 = load i32, i32* %num
	%r150 = call %struct.linkedNums* @getRands(i32 %r148, i32 %r149 )
	store %struct.linkedNums* %r150, %struct.linkedNums** %nums
	%r151 = load %struct.linkedNums*, %struct.linkedNums** %nums
	%r152 = call i32 @calcMean(%struct.linkedNums* %r151 )
	store i32 %r152, i32* %mean
	%r153 = load i32, i32* %mean
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r153)
	%r154 = load %struct.linkedNums*, %struct.linkedNums** %nums
	call void @range(%struct.linkedNums* %r154 )
	%r155 = load %struct.linkedNums*, %struct.linkedNums** %nums
	call void @approxSqrtAll(%struct.linkedNums* %r155 )
	store i32 0, i32* %_retval_
	br label %L40
L40:
	%r156 = load i32, i32* %_retval_
	ret i32 %r156
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8