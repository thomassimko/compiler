target triple="i686"



define i32 @function(i32 %_P_n)
{

L1:
	%_retval_ = alloca i32
	%n = alloca i32
	store i32 %_P_n, i32* %n
	%i = alloca i32
	%j = alloca i32
	%r0 = load i32, i32* %n
	%r1 = icmp sle i32 %r0, 0
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L3, label %L4

L3:
	store i32 0, i32* %_retval_
	br label %L2
L4:
	br label %L5
L5:
	store i32 0, i32* %i
	%r5 = load i32, i32* %i
	%r6 = load i32, i32* %n
	%r7 = load i32, i32* %n
	%r8 = mul i32 %r6, %r7
	%r9 = icmp slt i32 %r5, %r8
	%r10 = zext i1 %r9 to i32
	%r11 = trunc i32 %r10 to i1
	br i1 %r11, label %L6, label %L7

L6:
	%r12 = load i32, i32* %i
	%r13 = load i32, i32* %n
	%r14 = add i32 %r12, %r13
	store i32 %r14, i32* %j
	%r15 = load i32, i32* %j
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r15)
	%r16 = load i32, i32* %i
	%r17 = add i32 %r16, 1
	store i32 %r17, i32* %i
	%r18 = load i32, i32* %i
	%r19 = load i32, i32* %n
	%r20 = load i32, i32* %n
	%r21 = mul i32 %r19, %r20
	%r22 = icmp slt i32 %r18, %r21
	%r23 = zext i1 %r22 to i32
	%r24 = trunc i32 %r23 to i1
	br i1 %r24, label %L6, label %L7

L7:
	%r25 = load i32, i32* %n
	%r26 = sub i32 %r25, 1
	%r27 = call i32 @function(i32 %r26 )
	store i32 %r27, i32* %_retval_
	br label %L2
L2:
	%r4 = load i32, i32* %_retval_
	ret i32 %r4
}

define i32 @main()
{

L9:
	%_retval_ = alloca i32
	%num = alloca i32
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r29 = load i32, i32* @.read_scratch
	store i32 %r29, i32* %num
	%r30 = load i32, i32* %num
	call i32 @function(i32 %r30 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	store i32 0, i32* %_retval_
	br label %L10
L10:
	%r31 = load i32, i32* %_retval_
	ret i32 %r31
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8