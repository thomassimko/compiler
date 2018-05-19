target triple="i686"



define i32 @computeFib(i32 %input)
{

L1:
	%r0 = icmp eq i32 %input, 0
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	br label %L2
L4:
	%r3 = icmp sle i32 %input, 2
	%r4 = zext i1 %r3 to i32
	%r5 = trunc i32 %r4 to i1
	br i1 %r5, label %L6, label %L7

L6:
	br label %L2
L7:
	%r6 = sub i32 %input, 1
	%r7 = call i32 @computeFib(i32 %r6 )
	%r8 = sub i32 %input, 2
	%r9 = call i32 @computeFib(i32 %r8 )
	%r10 = add i32 %r7, %r9
	br label %L2
L2:
	%phi0 = phi i32 [0, %L3], [1, %L6], [%r10, %L7]
	ret i32 %phi0
}

define i32 @main()
{

L10:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r11 = load i32, i32* @.read_scratch
	%r12 = call i32 @computeFib(i32 %r11 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r12)
	br label %L11
L11:
	%phi1 = phi i32 [0, %L10]
	ret i32 %phi1
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8