target triple="i686"



define i32 @computeFib(i32 %_P_input)
{

L2:
	%_retval_ = alloca i32
	%input = alloca i32
	store i32 %_P_input, i32* %input
	%r0 = load i32, i32* %input
	%r1 = icmp eq i32 %r0, 0
	%r2 = zext i1 %r1 to i32
	%r3 = trunc i32 %r2 to i1
	br i1 %r3, label %L4, label %L5

L4:
	store i32 0, i32* %_retval_
	br label %L3
L5:
	%r5 = load i32, i32* %input
	%r6 = icmp sle i32 %r5, 2
	%r7 = zext i1 %r6 to i32
	%r8 = trunc i32 %r7 to i1
	br i1 %r8, label %L8, label %L9

L6:
	br label %L3
L8:
	store i32 1, i32* %_retval_
	br label %L3
L9:
	%r10 = load i32, i32* %input
	%r11 = sub i32 %r10, 1
	%r12 = call i32 @computeFib(i32 %r11 )
	%r13 = load i32, i32* %input
	%r14 = sub i32 %r13, 2
	%r15 = call i32 @computeFib(i32 %r14 )
	%r16 = add i32 %r12, %r15
	store i32 %r16, i32* %_retval_
	br label %L3
L10:
	br label %L6
L3:
	%r4 = load i32, i32* %_retval_
	ret i32 %r4
}

define i32 @main()
{

L14:
	%_retval_ = alloca i32
	%input = alloca i32
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* %input)
	%r18 = load i32, i32* %input
	%r19 = call i32 @computeFib(i32 %r18 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r19)
	store i32 0, i32* %_retval_
	br label %L15
L15:
	%r20 = load i32, i32* %_retval_
	ret i32 %r20
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8