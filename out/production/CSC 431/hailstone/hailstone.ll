target triple="i686"



define i32 @mod(i32 %_P_a, i32 %_P_b)
{

L1:
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
	br label %L2
L2:
	%r7 = load i32, i32* %_retval_
	ret i32 %r7
}

define void @hailstone(i32 %_P_n)
{

L4:
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%r8 = zext i1 1 to i32
	%r9 = trunc i32 %r8 to i1
	br i1 %r9, label %L6, label %L7

L6:
	%r10 = load i32, i32* %n
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r10)
	%r11 = load i32, i32* %n
	%r12 = call i32 @mod(i32 %r11, i32 2 )
	%r13 = icmp eq i32 %r12, 1
	%r14 = zext i1 %r13 to i32
	%r15 = trunc i32 %r14 to i1
	br i1 %r15, label %L8, label %L9

L8:
	%r16 = load i32, i32* %n
	%r17 = mul i32 3, %r16
	%r18 = add i32 %r17, 1
	store i32 %r18, i32* %n
	br label %L10
L9:
	%r19 = load i32, i32* %n
	%r20 = sdiv i32 %r19, 2
	store i32 %r20, i32* %n
	br label %L10
L10:
	%r21 = load i32, i32* %n
	%r22 = icmp sle i32 %r21, 1
	%r23 = zext i1 %r22 to i32
	%r24 = trunc i32 %r23 to i1
	br i1 %r24, label %L11, label %L12

L11:
	%r25 = load i32, i32* %n
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r25)
	br label %L5
L12:
	br label %L13
L13:
	%r26 = zext i1 1 to i32
	%r27 = trunc i32 %r26 to i1
	br i1 %r27, label %L6, label %L7

L7:
	br label %L5
L5:
	ret void
}

define i32 @main()
{

L15:
	%_retval_ = alloca i32
	%num = alloca i32
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r28 = load i32, i32* @.read_scratch
	store i32 %r28, i32* %num
	%r29 = load i32, i32* %num
	call void @hailstone(i32 %r29 )
	store i32 0, i32* %_retval_
	br label %L16
L16:
	%r30 = load i32, i32* %_retval_
	ret i32 %r30
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8