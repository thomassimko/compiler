target triple="i686"



define i32 @sum(i32 %_P_a, i32 %_P_b)
{

L1:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 %_P_a, i32* %a
	%b = alloca i32
	store i32 %_P_b, i32* %b
	%r0 = load i32, i32* %a
	%r1 = load i32, i32* %b
	%r2 = add i32 %r0, %r1
	store i32 %r2, i32* %_retval_
	br label %L2
L2:
	%r3 = load i32, i32* %_retval_
	ret i32 %r3
}

define i32 @fact(i32 %_P_n)
{

L4:
	%_retval_ = alloca i32
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%t = alloca i32
	%r4 = load i32, i32* %n
	%r5 = icmp eq i32 %r4, 1
	%r6 = zext i1 %r5 to i32
	%r7 = load i32, i32* %n
	%r8 = icmp eq i32 %r7, 0
	%r9 = zext i1 %r8 to i32
	%r10 = or i32 %r6, %r9
	%r11 = trunc i32 %r10 to i1
	br i1 %r11, label %L6, label %L7

L6:
	store i32 1, i32* %_retval_
	br label %L5
L7:
	br label %L8
L8:
	%r13 = load i32, i32* %n
	%r14 = icmp sle i32 %r13, 1
	%r15 = zext i1 %r14 to i32
	%r16 = trunc i32 %r15 to i1
	br i1 %r16, label %L9, label %L10

L9:
	%r17 = sub i32 0, 1
	%r18 = load i32, i32* %n
	%r19 = mul i32 %r17, %r18
	%r20 = call i32 @fact(i32 %r19 )
	store i32 %r20, i32* %_retval_
	br label %L5
L10:
	br label %L11
L11:
	%r22 = load i32, i32* %n
	%r23 = load i32, i32* %n
	%r24 = sub i32 %r23, 1
	%r25 = call i32 @fact(i32 %r24 )
	%r26 = mul i32 %r22, %r25
	store i32 %r26, i32* %t
	%r27 = load i32, i32* %t
	store i32 %r27, i32* %_retval_
	br label %L5
L5:
	%r12 = load i32, i32* %_retval_
	ret i32 %r12
}

define i32 @main()
{

L13:
	%_retval_ = alloca i32
	%num1 = alloca i32
	%num2 = alloca i32
	%flag = alloca i32
	store i32 0, i32* %flag
	%r29 = load i32, i32* %flag
	%r30 = sub i32 0, 1
	%r31 = icmp ne i32 %r29, %r30
	%r32 = zext i1 %r31 to i32
	%r33 = trunc i32 %r32 to i1
	br i1 %r33, label %L15, label %L16

L15:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r34 = load i32, i32* @.read_scratch
	store i32 %r34, i32* %num1
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r35 = load i32, i32* @.read_scratch
	store i32 %r35, i32* %num2
	%r36 = load i32, i32* %num1
	%r37 = call i32 @fact(i32 %r36 )
	store i32 %r37, i32* %num1
	%r38 = load i32, i32* %num2
	%r39 = call i32 @fact(i32 %r38 )
	store i32 %r39, i32* %num2
	%r40 = load i32, i32* %num1
	%r41 = load i32, i32* %num2
	%r42 = call i32 @sum(i32 %r40, i32 %r41 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r42)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r43 = load i32, i32* @.read_scratch
	store i32 %r43, i32* %flag
	%r44 = load i32, i32* %flag
	%r45 = sub i32 0, 1
	%r46 = icmp ne i32 %r44, %r45
	%r47 = zext i1 %r46 to i32
	%r48 = trunc i32 %r47 to i1
	br i1 %r48, label %L15, label %L16

L16:
	store i32 0, i32* %_retval_
	br label %L14
L14:
	%r49 = load i32, i32* %_retval_
	ret i32 %r49
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8