target triple="i686"



define i32 @isqrt(i32 %_P_a)
{

L2:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 %_P_a, i32* %a
	%square = alloca i32
	%delta = alloca i32
	store i32 1, i32* %square
	store i32 3, i32* %delta
	%r5 = load i32* %square
	%r6 = load i32* %a
	%r7 = icmp sle i32 %r5, %r6
	%r8 = zext i1 %r7 to i32
	%r9 = trunc i32 %r8 to i1
	br i1 %r9, label %L4, label %L5

L4:
	%r0 = load i32* %square
	%r1 = load i32* %delta
	%r2 = add i32 %r0, %r1
	store i32 %r2, i32* %square
	%r3 = load i32* %delta
	%r4 = add i32 %r3, 2
	store i32 %r4, i32* %delta
	%r10 = load i32* %square
	%r11 = load i32* %a
	%r12 = icmp sle i32 %r10, %r11
	%r13 = zext i1 %r12 to i32
	%r14 = trunc i32 %r13 to i1
	br i1 %r14, label %L4, label %L5

L5:
	%r15 = load i32* %delta
	%r16 = sdiv i32 %r15, 2
	%r17 = sub i32 %r16, 1
	store i32 %r17, i32* %_retval_
	br label %L3
L3:
	%r18 = load i32* %_retval_
	ret i32 %r18
}

define i32 @prime(i32 %_P_a)
{

L7:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 %_P_a, i32* %a
	%max = alloca i32
	%divisor = alloca i32
	%remainder = alloca i32
	%r19 = load i32* %a
	%r20 = icmp slt i32 %r19, 2
	%r21 = zext i1 %r20 to i32
	%r22 = trunc i32 %r21 to i1
	br i1 %r22, label %L9, label %L10

L9:
	%r23 = zext i1 0 to i32
	store i32 %r23, i32* %_retval_
	br label %L8
L10:
	%r25 = load i32* %a
	%r26 = call i32 @isqrt(i32 %r25 )
	store i32 %r26, i32* %max
	store i32 2, i32* %divisor
	%r42 = load i32* %divisor
	%r43 = load i32* %max
	%r44 = icmp sle i32 %r42, %r43
	%r45 = zext i1 %r44 to i32
	%r46 = trunc i32 %r45 to i1
	br i1 %r46, label %L13, label %L18

L11:
	br label %L8
L14:
	%r38 = zext i1 0 to i32
	store i32 %r38, i32* %_retval_
	br label %L8
L15:
	br label %L16
L16:
	%r40 = load i32* %divisor
	%r41 = add i32 %r40, 1
	store i32 %r41, i32* %divisor
	%r47 = load i32* %divisor
	%r48 = load i32* %max
	%r49 = icmp sle i32 %r47, %r48
	%r50 = zext i1 %r49 to i32
	%r51 = trunc i32 %r50 to i1
	br i1 %r51, label %L13, label %L18

L13:
	%r27 = load i32* %a
	%r28 = load i32* %a
	%r29 = load i32* %divisor
	%r30 = sdiv i32 %r28, %r29
	%r31 = load i32* %divisor
	%r32 = mul i32 %r30, %r31
	%r33 = sub i32 %r27, %r32
	store i32 %r33, i32* %remainder
	%r34 = load i32* %remainder
	%r35 = icmp eq i32 %r34, 0
	%r36 = zext i1 %r35 to i32
	%r37 = trunc i32 %r36 to i1
	br i1 %r37, label %L14, label %L15

L18:
	%r52 = zext i1 1 to i32
	store i32 %r52, i32* %_retval_
	br label %L8
L8:
	%r24 = load i32* %_retval_
	ret i32 %r24
}

define i32 @main()
{

L21:
	%_retval_ = alloca i32
	%limit = alloca i32
	%a = alloca i32
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i32* %limit)
	store i32 0, i32* %a
	%r60 = load i32* %a
	%r61 = load i32* %limit
	%r62 = icmp sle i32 %r60, %r61
	%r63 = zext i1 %r62 to i32
	%r64 = trunc i32 %r63 to i1
	br i1 %r64, label %L23, label %L27

L24:
	%r57 = load i32* %a
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i32 %r57)
	br label %L26
L25:
	br label %L26
L26:
	%r58 = load i32* %a
	%r59 = add i32 %r58, 1
	store i32 %r59, i32* %a
	%r65 = load i32* %a
	%r66 = load i32* %limit
	%r67 = icmp sle i32 %r65, %r66
	%r68 = zext i1 %r67 to i32
	%r69 = trunc i32 %r68 to i1
	br i1 %r69, label %L23, label %L27

L23:
	%r54 = load i32* %a
	%r55 = call i32 @prime(i32 %r54 )
	%r56 = trunc i32 %r55 to i1
	br i1 %r56, label %L24, label %L25

L27:
	store i32 0, i32* %_retval_
	br label %L22
L22:
	%r70 = load i32* %_retval_
	ret i32 %r70
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8