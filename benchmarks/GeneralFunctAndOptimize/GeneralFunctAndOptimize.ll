target triple="i686"

%struct.IntHolder = type {i32}
@interval = common global i32 0, align 8
@end = common global i32 0, align 8

define i32 @multBy4xTimes(%struct.IntHolder* %_P_num, i32 %_P_timesLeft)
{

L2:
	%_retval_ = alloca i32
	%num = alloca %struct.IntHolder*
	store %struct.IntHolder* %_P_num, %struct.IntHolder** %num
	%timesLeft = alloca i32
	store i32 %_P_timesLeft, i32* %timesLeft
	%r0 = load i32* %timesLeft
	%r1 = icmp sle i32 %r0, 0
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L4, label %L5

L4:
	%r4 = load %struct.IntHolder** %num
	%r5 = getelementptr %struct.IntHolder* %r4, i1 0, i32 0
	%r6 = load i32* %r5
	store i32 %r6, i32* %_retval_
	br label %L3
L5:
	br label %L6
L6:
	%r8 = load %struct.IntHolder** %num
	%r9 = getelementptr %struct.IntHolder* %r8, i1 0, i32 0
	%r10 = load %struct.IntHolder** %num
	%r11 = getelementptr %struct.IntHolder* %r10, i1 0, i32 0
	%r12 = load i32* %r11
	%r13 = mul i32 4, %r12
	store i32 %r13, i32* %r9
	%r14 = load %struct.IntHolder** %num
	%r15 = load i32* %timesLeft
	%r16 = sub i32 %r15, 1
	call i32 @multBy4xTimes(%struct.IntHolder* %r14, i32 %r16 )
	%r17 = load %struct.IntHolder** %num
	%r18 = getelementptr %struct.IntHolder* %r17, i1 0, i32 0
	%r19 = load i32* %r18
	store i32 %r19, i32* %_retval_
	br label %L3
L3:
	%r7 = load i32* %_retval_
	ret i32 %r7
}

define void @divideBy8(%struct.IntHolder* %_P_num)
{

L9:
	%num = alloca %struct.IntHolder*
	store %struct.IntHolder* %_P_num, %struct.IntHolder** %num
	%r21 = load %struct.IntHolder** %num
	%r22 = getelementptr %struct.IntHolder* %r21, i1 0, i32 0
	%r23 = load %struct.IntHolder** %num
	%r24 = getelementptr %struct.IntHolder* %r23, i1 0, i32 0
	%r25 = load i32* %r24
	%r26 = sdiv i32 %r25, 2
	store i32 %r26, i32* %r22
	%r27 = load %struct.IntHolder** %num
	%r28 = getelementptr %struct.IntHolder* %r27, i1 0, i32 0
	%r29 = load %struct.IntHolder** %num
	%r30 = getelementptr %struct.IntHolder* %r29, i1 0, i32 0
	%r31 = load i32* %r30
	%r32 = sdiv i32 %r31, 2
	store i32 %r32, i32* %r28
	%r33 = load %struct.IntHolder** %num
	%r34 = getelementptr %struct.IntHolder* %r33, i1 0, i32 0
	%r35 = load %struct.IntHolder** %num
	%r36 = getelementptr %struct.IntHolder* %r35, i1 0, i32 0
	%r37 = load i32* %r36
	%r38 = sdiv i32 %r37, 2
	store i32 %r38, i32* %r34
	br label %L10
L10:
	ret void
}

define i32 @main()
{

L12:
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
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i32* %start)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i32* @interval)
	%r41 = load i32* %start
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r41)
	%r42 = load i32* @interval
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r42)
	store i32 0, i32* %countOuter
	store i32 0, i32* %countInner
	store i32 0, i32* %calc
	%r87 = load i32* %countOuter
	%r88 = icmp slt i32 %r87, 50
	%r89 = zext i1 %r88 to i32
	%r90 = trunc i32 %r89 to i1
	br i1 %r90, label %L14, label %L20

L16:
	store i32 1, i32* %tempInterval
	br label %L18
L17:
	br label %L18
L18:
	%r72 = load i32* %countInner
	%r73 = load i32* %tempInterval
	%r74 = add i32 %r72, %r73
	store i32 %r74, i32* %countInner
	%r80 = load i32* %countInner
	%r81 = load i32* @end
	%r82 = icmp sle i32 %r80, %r81
	%r83 = zext i1 %r82 to i32
	%r84 = trunc i32 %r83 to i1
	br i1 %r84, label %L15, label %L19

L15:
	%r43 = mul i32 1, 2
	%r44 = mul i32 %r43, 3
	%r45 = mul i32 %r44, 4
	%r46 = mul i32 %r45, 5
	%r47 = mul i32 %r46, 6
	%r48 = mul i32 %r47, 7
	%r49 = mul i32 %r48, 8
	%r50 = mul i32 %r49, 9
	%r51 = mul i32 %r50, 10
	%r52 = mul i32 %r51, 11
	store i32 %r52, i32* %calc
	%r53 = load i32* %countInner
	%r54 = add i32 %r53, 1
	store i32 %r54, i32* %countInner
	%r55 = load %struct.IntHolder** %x
	%r56 = getelementptr %struct.IntHolder* %r55, i1 0, i32 0
	%r57 = load i32* %countInner
	store i32 %r57, i32* %r56
	%r58 = load %struct.IntHolder** %x
	%r59 = getelementptr %struct.IntHolder* %r58, i1 0, i32 0
	%r60 = load i32* %r59
	store i32 %r60, i32* %tempAnswer
	%r61 = load %struct.IntHolder** %x
	call i32 @multBy4xTimes(%struct.IntHolder* %r61, i32 2 )
	%r62 = load %struct.IntHolder** %x
	call void @divideBy8(%struct.IntHolder* %r62 )
	%r63 = load i32* @interval
	%r64 = sub i32 %r63, 1
	store i32 %r64, i32* %tempInterval
	%r65 = load i32* %tempInterval
	%r66 = icmp sle i32 %r65, 0
	%r67 = zext i1 %r66 to i32
	store i32 %r67, i32* %uselessVar
	%r68 = load i32* %tempInterval
	%r69 = icmp sle i32 %r68, 0
	%r70 = zext i1 %r69 to i32
	%r71 = trunc i32 %r70 to i1
	br i1 %r71, label %L16, label %L17

L19:
	%r85 = load i32* %countOuter
	%r86 = add i32 %r85, 1
	store i32 %r86, i32* %countOuter
	%r91 = load i32* %countOuter
	%r92 = icmp slt i32 %r91, 50
	%r93 = zext i1 %r92 to i32
	%r94 = trunc i32 %r93 to i1
	br i1 %r94, label %L14, label %L20

L14:
	store i32 0, i32* %countInner
	%r75 = load i32* %countInner
	%r76 = load i32* @end
	%r77 = icmp sle i32 %r75, %r76
	%r78 = zext i1 %r77 to i32
	%r79 = trunc i32 %r78 to i1
	br i1 %r79, label %L15, label %L19

L20:
	%r95 = load i32* %countInner
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r95)
	%r96 = load i32* %calc
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r96)
	store i32 0, i32* %_retval_
	br label %L13
L13:
	%r97 = load i32* %_retval_
	ret i32 %r97
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8