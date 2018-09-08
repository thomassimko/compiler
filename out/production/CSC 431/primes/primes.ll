target triple="i686"



define i32 @isqrt(i32 %_P_a)
{

L1:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 %_P_a, i32* %a
	%square = alloca i32
	%delta = alloca i32
	store i32 1, i32* %square
	store i32 3, i32* %delta
	%r0 = load i32, i32* %square
	%r1 = load i32, i32* %a
	%r2 = icmp sle i32 %r0, %r1
	%r3 = zext i1 %r2 to i32
	%r4 = trunc i32 %r3 to i1
	br i1 %r4, label %L3, label %L4

L3:
	%r5 = load i32, i32* %square
	%r6 = load i32, i32* %delta
	%r7 = add i32 %r5, %r6
	store i32 %r7, i32* %square
	%r8 = load i32, i32* %delta
	%r9 = add i32 %r8, 2
	store i32 %r9, i32* %delta
	%r10 = load i32, i32* %square
	%r11 = load i32, i32* %a
	%r12 = icmp sle i32 %r10, %r11
	%r13 = zext i1 %r12 to i32
	%r14 = trunc i32 %r13 to i1
	br i1 %r14, label %L3, label %L4

L4:
	%r15 = load i32, i32* %delta
	%r16 = sdiv i32 %r15, 2
	%r17 = sub i32 %r16, 1
	store i32 %r17, i32* %_retval_
	br label %L2
L2:
	%r18 = load i32, i32* %_retval_
	ret i32 %r18
}

define i32 @prime(i32 %_P_a)
{

L6:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 %_P_a, i32* %a
	%max = alloca i32
	%divisor = alloca i32
	%remainder = alloca i32
	%r19 = load i32, i32* %a
	%r20 = icmp slt i32 %r19, 2
	%r21 = zext i1 %r20 to i32
	%r22 = trunc i32 %r21 to i1
	br i1 %r22, label %L8, label %L9

L8:
	%r23 = zext i1 0 to i32
	store i32 %r23, i32* %_retval_
	br label %L7
L9:
	%r25 = load i32, i32* %a
	%r26 = call i32 @isqrt(i32 %r25 )
	store i32 %r26, i32* %max
	store i32 2, i32* %divisor
	%r27 = load i32, i32* %divisor
	%r28 = load i32, i32* %max
	%r29 = icmp sle i32 %r27, %r28
	%r30 = zext i1 %r29 to i32
	%r31 = trunc i32 %r30 to i1
	br i1 %r31, label %L11, label %L12

L11:
	%r32 = load i32, i32* %a
	%r33 = load i32, i32* %a
	%r34 = load i32, i32* %divisor
	%r35 = sdiv i32 %r33, %r34
	%r36 = load i32, i32* %divisor
	%r37 = mul i32 %r35, %r36
	%r38 = sub i32 %r32, %r37
	store i32 %r38, i32* %remainder
	%r39 = load i32, i32* %remainder
	%r40 = icmp eq i32 %r39, 0
	%r41 = zext i1 %r40 to i32
	%r42 = trunc i32 %r41 to i1
	br i1 %r42, label %L13, label %L14

L13:
	%r43 = zext i1 0 to i32
	store i32 %r43, i32* %_retval_
	br label %L7
L14:
	br label %L15
L15:
	%r45 = load i32, i32* %divisor
	%r46 = add i32 %r45, 1
	store i32 %r46, i32* %divisor
	%r47 = load i32, i32* %divisor
	%r48 = load i32, i32* %max
	%r49 = icmp sle i32 %r47, %r48
	%r50 = zext i1 %r49 to i32
	%r51 = trunc i32 %r50 to i1
	br i1 %r51, label %L11, label %L12

L12:
	%r52 = zext i1 1 to i32
	store i32 %r52, i32* %_retval_
	br label %L7
L7:
	%r24 = load i32, i32* %_retval_
	ret i32 %r24
}

define i32 @main()
{

L17:
	%_retval_ = alloca i32
	%limit = alloca i32
	%a = alloca i32
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r54 = load i32, i32* @.read_scratch
	store i32 %r54, i32* %limit
	store i32 0, i32* %a
	%r55 = load i32, i32* %a
	%r56 = load i32, i32* %limit
	%r57 = icmp sle i32 %r55, %r56
	%r58 = zext i1 %r57 to i32
	%r59 = trunc i32 %r58 to i1
	br i1 %r59, label %L19, label %L20

L19:
	%r60 = load i32, i32* %a
	%r61 = call i32 @prime(i32 %r60 )
	%r62 = trunc i32 %r61 to i1
	br i1 %r62, label %L21, label %L22

L21:
	%r63 = load i32, i32* %a
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r63)
	br label %L23
L22:
	br label %L23
L23:
	%r64 = load i32, i32* %a
	%r65 = add i32 %r64, 1
	store i32 %r65, i32* %a
	%r66 = load i32, i32* %a
	%r67 = load i32, i32* %limit
	%r68 = icmp sle i32 %r66, %r67
	%r69 = zext i1 %r68 to i32
	%r70 = trunc i32 %r69 to i1
	br i1 %r70, label %L19, label %L20

L20:
	store i32 0, i32* %_retval_
	br label %L18
L18:
	%r71 = load i32, i32* %_retval_
	ret i32 %r71
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8