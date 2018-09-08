target triple="i686"

%struct.IntHolder = type {i32}
@interval = common global i32 0, align 8
@end = common global i32 0, align 8

define i32 @multBy4xTimes(%struct.IntHolder* %_P_num, i32 %_P_timesLeft)
{

L1:
	%_retval_ = alloca i32
	%num = alloca %struct.IntHolder*
	store %struct.IntHolder* %_P_num, %struct.IntHolder** %num
	%timesLeft = alloca i32
	store i32 %_P_timesLeft, i32* %timesLeft
	%r0 = load i32, i32* %timesLeft
	%r1 = icmp sle i32 %r0, 0
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L3, label %L4

L3:
	%r4 = load %struct.IntHolder*, %struct.IntHolder** %num
	%r5 = getelementptr %struct.IntHolder , %struct.IntHolder* %r4, i1 0, i32 0
	%r6 = load i32, i32* %r5
	store i32 %r6, i32* %_retval_
	br label %L2
L4:
	br label %L5
L5:
	%r8 = load %struct.IntHolder*, %struct.IntHolder** %num
	%r9 = getelementptr %struct.IntHolder , %struct.IntHolder* %r8, i1 0, i32 0
	%r10 = load i32, i32* %r9
	%r11 = mul i32 4, %r10
	%r12 = load %struct.IntHolder*, %struct.IntHolder** %num
	%r13 = getelementptr %struct.IntHolder , %struct.IntHolder* %r12, i1 0, i32 0
	store i32 %r11, i32* %r13
	%r14 = load %struct.IntHolder*, %struct.IntHolder** %num
	%r15 = load i32, i32* %timesLeft
	%r16 = sub i32 %r15, 1
	call i32 @multBy4xTimes(%struct.IntHolder* %r14, i32 %r16 )
	%r17 = load %struct.IntHolder*, %struct.IntHolder** %num
	%r18 = getelementptr %struct.IntHolder , %struct.IntHolder* %r17, i1 0, i32 0
	%r19 = load i32, i32* %r18
	store i32 %r19, i32* %_retval_
	br label %L2
L2:
	%r7 = load i32, i32* %_retval_
	ret i32 %r7
}

define void @divideBy8(%struct.IntHolder* %_P_num)
{

L7:
	%num = alloca %struct.IntHolder*
	store %struct.IntHolder* %_P_num, %struct.IntHolder** %num
	%r21 = load %struct.IntHolder*, %struct.IntHolder** %num
	%r22 = getelementptr %struct.IntHolder , %struct.IntHolder* %r21, i1 0, i32 0
	%r23 = load i32, i32* %r22
	%r24 = sdiv i32 %r23, 2
	%r25 = load %struct.IntHolder*, %struct.IntHolder** %num
	%r26 = getelementptr %struct.IntHolder , %struct.IntHolder* %r25, i1 0, i32 0
	store i32 %r24, i32* %r26
	%r27 = load %struct.IntHolder*, %struct.IntHolder** %num
	%r28 = getelementptr %struct.IntHolder , %struct.IntHolder* %r27, i1 0, i32 0
	%r29 = load i32, i32* %r28
	%r30 = sdiv i32 %r29, 2
	%r31 = load %struct.IntHolder*, %struct.IntHolder** %num
	%r32 = getelementptr %struct.IntHolder , %struct.IntHolder* %r31, i1 0, i32 0
	store i32 %r30, i32* %r32
	%r33 = load %struct.IntHolder*, %struct.IntHolder** %num
	%r34 = getelementptr %struct.IntHolder , %struct.IntHolder* %r33, i1 0, i32 0
	%r35 = load i32, i32* %r34
	%r36 = sdiv i32 %r35, 2
	%r37 = load %struct.IntHolder*, %struct.IntHolder** %num
	%r38 = getelementptr %struct.IntHolder , %struct.IntHolder* %r37, i1 0, i32 0
	store i32 %r36, i32* %r38
	br label %L8
L8:
	ret void
}

define i32 @main()
{

L10:
	%_retval_ = alloca i32
	%start = alloca i32
	%countOuter = alloca i32
	%countInner = alloca i32
	%calc = alloca i32
	%tempAnswer = alloca i32
	%tempInterval = alloca i32
	%x = alloca %struct.IntHolder*
	%uselessVar = alloca i32
	%uselessVar2 = alloca i32
	%r39 = call i8* @malloc(i32 8)
	%r40 = bitcast i8* %r39 to %struct.IntHolder*
	store %struct.IntHolder* %r40, %struct.IntHolder** %x
	store i32 1000000, i32* @end
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r41 = load i32, i32* @.read_scratch
	store i32 %r41, i32* %start
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r42 = load i32, i32* @.read_scratch
	store i32 %r42, i32* @interval
	%r43 = load i32, i32* %start
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r43)
	%r44 = load i32, i32* @interval
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r44)
	store i32 0, i32* %countOuter
	store i32 0, i32* %countInner
	store i32 0, i32* %calc
	%r45 = load i32, i32* %countOuter
	%r46 = icmp slt i32 %r45, 50
	%r47 = zext i1 %r46 to i32
	%r48 = trunc i32 %r47 to i1
	br i1 %r48, label %L12, label %L13

L12:
	store i32 0, i32* %countInner
	%r49 = load i32, i32* %countInner
	%r50 = load i32, i32* @end
	%r51 = icmp sle i32 %r49, %r50
	%r52 = zext i1 %r51 to i32
	%r53 = trunc i32 %r52 to i1
	br i1 %r53, label %L14, label %L15

L14:
	%r54 = mul i32 1, 2
	%r55 = mul i32 %r54, 3
	%r56 = mul i32 %r55, 4
	%r57 = mul i32 %r56, 5
	%r58 = mul i32 %r57, 6
	%r59 = mul i32 %r58, 7
	%r60 = mul i32 %r59, 8
	%r61 = mul i32 %r60, 9
	%r62 = mul i32 %r61, 10
	%r63 = mul i32 %r62, 11
	store i32 %r63, i32* %calc
	%r64 = load i32, i32* %countInner
	%r65 = add i32 %r64, 1
	store i32 %r65, i32* %countInner
	%r66 = load i32, i32* %countInner
	%r67 = load %struct.IntHolder*, %struct.IntHolder** %x
	%r68 = getelementptr %struct.IntHolder , %struct.IntHolder* %r67, i1 0, i32 0
	store i32 %r66, i32* %r68
	%r69 = load %struct.IntHolder*, %struct.IntHolder** %x
	%r70 = getelementptr %struct.IntHolder , %struct.IntHolder* %r69, i1 0, i32 0
	%r71 = load i32, i32* %r70
	store i32 %r71, i32* %tempAnswer
	%r72 = load %struct.IntHolder*, %struct.IntHolder** %x
	call i32 @multBy4xTimes(%struct.IntHolder* %r72, i32 2 )
	%r73 = load %struct.IntHolder*, %struct.IntHolder** %x
	call void @divideBy8(%struct.IntHolder* %r73 )
	%r74 = load i32, i32* @interval
	%r75 = sub i32 %r74, 1
	store i32 %r75, i32* %tempInterval
	%r76 = load i32, i32* %tempInterval
	%r77 = icmp sle i32 %r76, 0
	%r78 = zext i1 %r77 to i32
	store i32 %r78, i32* %uselessVar
	%r79 = load i32, i32* %tempInterval
	%r80 = icmp sle i32 %r79, 0
	%r81 = zext i1 %r80 to i32
	%r82 = trunc i32 %r81 to i1
	br i1 %r82, label %L16, label %L17

L16:
	store i32 1, i32* %tempInterval
	br label %L18
L17:
	br label %L18
L18:
	%r83 = load i32, i32* %countInner
	%r84 = load i32, i32* %tempInterval
	%r85 = add i32 %r83, %r84
	store i32 %r85, i32* %countInner
	%r86 = load i32, i32* %countInner
	%r87 = load i32, i32* @end
	%r88 = icmp sle i32 %r86, %r87
	%r89 = zext i1 %r88 to i32
	%r90 = trunc i32 %r89 to i1
	br i1 %r90, label %L14, label %L15

L15:
	%r91 = load i32, i32* %countOuter
	%r92 = add i32 %r91, 1
	store i32 %r92, i32* %countOuter
	%r93 = load i32, i32* %countOuter
	%r94 = icmp slt i32 %r93, 50
	%r95 = zext i1 %r94 to i32
	%r96 = trunc i32 %r95 to i1
	br i1 %r96, label %L12, label %L13

L13:
	%r97 = load i32, i32* %countInner
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r97)
	%r98 = load i32, i32* %calc
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r98)
	store i32 0, i32* %_retval_
	br label %L11
L11:
	%r99 = load i32, i32* %_retval_
	ret i32 %r99
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8