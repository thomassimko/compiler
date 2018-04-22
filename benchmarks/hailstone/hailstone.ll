target triple="i686"



define i32 @mod(i32 %_P_a, i32 %_P_b)
{

L2:
	%_retval_ = alloca i32
	%a = alloca i32
	store i32 %_P_a, i32* %a
	%b = alloca i32
	store i32 %_P_b, i32* %b
	%r0 = load i32, i32* %a
	%r1 = load i32, i32* %a
	%r2 = load i32, i32* %b
	%r3 = sdiv i32 %r1, %r2
	%r4 = load i32, i32* %b
	%r5 = mul i32 %r3, %r4
	%r6 = sub i32 %r0, %r5
	store i32 %r6, i32* %_retval_
	br label %L3
L3:
	%r7 = load i32, i32* %_retval_
	ret i32 %r7
}

define void @hailstone(i32 %_P_n)
{

L5:
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%r24 = zext i1 1 to i32
	%r25 = trunc i32 %r24 to i1
	br i1 %r25, label %L7, label %L15

L8:
	%r14 = load i32, i32* %n
	%r15 = mul i32 3, %r14
	%r16 = add i32 %r15, 1
	store i32 %r16, i32* %n
	br label %L10
L9:
	%r17 = load i32, i32* %n
	%r18 = sdiv i32 %r17, 2
	store i32 %r18, i32* %n
	br label %L10
L10:
	%r19 = load i32, i32* %n
	%r20 = icmp sle i32 %r19, 1
	%r21 = zext i1 %r20 to i32
	%r22 = trunc i32 %r21 to i1
	br i1 %r22, label %L11, label %L12

L11:
	%r23 = load i32, i32* %n
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r23)
	br label %L6
L12:
	br label %L13
L13:
	%r26 = zext i1 1 to i32
	%r27 = trunc i32 %r26 to i1
	br i1 %r27, label %L7, label %L15

L7:
	%r8 = load i32, i32* %n
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r8)
	%r9 = load i32, i32* %n
	%r10 = call i32 @mod(i32 %r9, i32 2 )
	%r11 = icmp eq i32 %r10, 1
	%r12 = zext i1 %r11 to i32
	%r13 = trunc i32 %r12 to i1
	br i1 %r13, label %L8, label %L9

L15:
	br label %L6
L6:
	ret void
}

define i32 @main()
{

L17:
	%_retval_ = alloca i32
	%num = alloca i32
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %num)
	%r28 = load i32, i32* %num
	call void @hailstone(i32 %r28 )
	store i32 0, i32* %_retval_
	br label %L18
L18:
	%r29 = load i32, i32* %_retval_
	ret i32 %r29
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8