target triple="i686"



define i32 @wait(i32 %_P_waitTime)
{

L2:
	%_retval_ = alloca i32
	%waitTime = alloca i32
	store i32 %_P_waitTime, i32* %waitTime
	%r2 = load i32, i32* %waitTime
	%r3 = icmp sgt i32 %r2, 0
	%r4 = zext i1 %r3 to i32
	%r5 = trunc i32 %r4 to i1
	br i1 %r5, label %L4, label %L5

L4:
	%r0 = load i32, i32* %waitTime
	%r1 = sub i32 %r0, 1
	store i32 %r1, i32* %waitTime
	%r6 = load i32, i32* %waitTime
	%r7 = icmp sgt i32 %r6, 0
	%r8 = zext i1 %r7 to i32
	%r9 = trunc i32 %r8 to i1
	br i1 %r9, label %L4, label %L5

L5:
	store i32 0, i32* %_retval_
	br label %L3
L3:
	%r10 = load i32, i32* %_retval_
	ret i32 %r10
}

define i32 @power(i32 %_P_base, i32 %_P_exponent)
{

L7:
	%_retval_ = alloca i32
	%base = alloca i32
	store i32 %_P_base, i32* %base
	%exponent = alloca i32
	store i32 %_P_exponent, i32* %exponent
	%product = alloca i32
	store i32 1, i32* %product
	%r16 = load i32, i32* %exponent
	%r17 = icmp sgt i32 %r16, 0
	%r18 = zext i1 %r17 to i32
	%r19 = trunc i32 %r18 to i1
	br i1 %r19, label %L9, label %L10

L9:
	%r11 = load i32, i32* %product
	%r12 = load i32, i32* %base
	%r13 = mul i32 %r11, %r12
	store i32 %r13, i32* %product
	%r14 = load i32, i32* %exponent
	%r15 = sub i32 %r14, 1
	store i32 %r15, i32* %exponent
	%r20 = load i32, i32* %exponent
	%r21 = icmp sgt i32 %r20, 0
	%r22 = zext i1 %r21 to i32
	%r23 = trunc i32 %r22 to i1
	br i1 %r23, label %L9, label %L10

L10:
	%r24 = load i32, i32* %product
	store i32 %r24, i32* %_retval_
	br label %L8
L8:
	%r25 = load i32, i32* %_retval_
	ret i32 %r25
}

define i32 @recursiveDecimalSum(i32 %_P_binaryNum, i32 %_P_decimalSum, i32 %_P_recursiveDepth)
{

L12:
	%_retval_ = alloca i32
	%binaryNum = alloca i32
	store i32 %_P_binaryNum, i32* %binaryNum
	%decimalSum = alloca i32
	store i32 %_P_decimalSum, i32* %decimalSum
	%recursiveDepth = alloca i32
	store i32 %_P_recursiveDepth, i32* %recursiveDepth
	%tempNum = alloca i32
	%base = alloca i32
	%remainder = alloca i32
	%r26 = load i32, i32* %binaryNum
	%r27 = icmp sgt i32 %r26, 0
	%r28 = zext i1 %r27 to i32
	%r29 = trunc i32 %r28 to i1
	br i1 %r29, label %L14, label %L15

L14:
	store i32 2, i32* %base
	%r30 = load i32, i32* %binaryNum
	%r31 = sdiv i32 %r30, 10
	store i32 %r31, i32* %tempNum
	%r32 = load i32, i32* %tempNum
	%r33 = mul i32 %r32, 10
	store i32 %r33, i32* %tempNum
	%r34 = load i32, i32* %binaryNum
	%r35 = load i32, i32* %tempNum
	%r36 = sub i32 %r34, %r35
	store i32 %r36, i32* %tempNum
	%r37 = load i32, i32* %tempNum
	%r38 = icmp eq i32 %r37, 1
	%r39 = zext i1 %r38 to i32
	%r40 = trunc i32 %r39 to i1
	br i1 %r40, label %L17, label %L18

L15:
	br label %L16
L16:
	%r53 = load i32, i32* %decimalSum
	store i32 %r53, i32* %_retval_
	br label %L13
L17:
	%r41 = load i32, i32* %decimalSum
	%r42 = load i32, i32* %base
	%r43 = load i32, i32* %recursiveDepth
	%r44 = call i32 @power(i32 %r42, i32 %r43 )
	%r45 = add i32 %r41, %r44
	store i32 %r45, i32* %decimalSum
	br label %L19
L18:
	br label %L19
L19:
	%r46 = load i32, i32* %binaryNum
	%r47 = sdiv i32 %r46, 10
	%r48 = load i32, i32* %decimalSum
	%r49 = load i32, i32* %recursiveDepth
	%r50 = add i32 %r49, 1
	%r51 = call i32 @recursiveDecimalSum(i32 %r47, i32 %r48, i32 %r50 )
	store i32 %r51, i32* %_retval_
	br label %L13
L13:
	%r52 = load i32, i32* %_retval_
	ret i32 %r52
}

define i32 @convertToDecimal(i32 %_P_binaryNum)
{

L22:
	%_retval_ = alloca i32
	%binaryNum = alloca i32
	store i32 %_P_binaryNum, i32* %binaryNum
	%recursiveDepth = alloca i32
	%decimalSum = alloca i32
	store i32 0, i32* %recursiveDepth
	store i32 0, i32* %decimalSum
	%r55 = load i32, i32* %binaryNum
	%r56 = load i32, i32* %decimalSum
	%r57 = load i32, i32* %recursiveDepth
	%r58 = call i32 @recursiveDecimalSum(i32 %r55, i32 %r56, i32 %r57 )
	store i32 %r58, i32* %_retval_
	br label %L23
L23:
	%r59 = load i32, i32* %_retval_
	ret i32 %r59
}

define i32 @main()
{

L25:
	%_retval_ = alloca i32
	%number = alloca i32
	%waitTime = alloca i32
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %number)
	%r60 = load i32, i32* %number
	%r61 = call i32 @convertToDecimal(i32 %r60 )
	store i32 %r61, i32* %number
	%r62 = load i32, i32* %number
	%r63 = load i32, i32* %number
	%r64 = mul i32 %r62, %r63
	store i32 %r64, i32* %waitTime
	%r68 = load i32, i32* %waitTime
	%r69 = icmp sgt i32 %r68, 0
	%r70 = zext i1 %r69 to i32
	%r71 = trunc i32 %r70 to i1
	br i1 %r71, label %L27, label %L28

L27:
	%r65 = load i32, i32* %waitTime
	call i32 @wait(i32 %r65 )
	%r66 = load i32, i32* %waitTime
	%r67 = sub i32 %r66, 1
	store i32 %r67, i32* %waitTime
	%r72 = load i32, i32* %waitTime
	%r73 = icmp sgt i32 %r72, 0
	%r74 = zext i1 %r73 to i32
	%r75 = trunc i32 %r74 to i1
	br i1 %r75, label %L27, label %L28

L28:
	%r76 = load i32, i32* %number
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r76)
	store i32 0, i32* %_retval_
	br label %L26
L26:
	%r77 = load i32, i32* %_retval_
	ret i32 %r77
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8