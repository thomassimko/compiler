target triple="i686"



define i32 @function(i32 %n)
{

L1:
	%r0 = icmp sle i32 %n, 0
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	br label %L2
L4:
	br label %L5
L5:
	%r3 = mul i32 %n, %n
	%r4 = icmp slt i32 0, %r3
	%r5 = zext i1 %r4 to i32
	%r6 = trunc i32 %r5 to i1
	br i1 %r6, label %L6, label %L7

L6:
	%phi0 = phi i32 [0, %L5], [%r8, %L6]
	%phi1 = phi i32 [%n, %L5], [%phi1, %L6]
	%r7 = add i32 %phi0, %phi1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r7)
	%r8 = add i32 %phi0, 1
	%r9 = mul i32 %phi1, %phi1
	%r10 = icmp slt i32 %r8, %r9
	%r11 = zext i1 %r10 to i32
	%r12 = trunc i32 %r11 to i1
	br i1 %r12, label %L6, label %L7

L7:
	%phi2 = phi i32 [%n, %L5], [%phi1, %L6]
	%r13 = sub i32 %phi2, 1
	%r14 = call i32 @function(i32 %r13 )
	br label %L2
L2:
	%phi3 = phi i32 [0, %L3], [%r14, %L7]
	ret i32 %phi3
}

define i32 @main()
{

L9:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r15 = load i32, i32* @.read_scratch
	call i32 @function(i32 %r15 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L10
L10:
	%phi4 = phi i32 [0, %L9]
	ret i32 %phi4
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8