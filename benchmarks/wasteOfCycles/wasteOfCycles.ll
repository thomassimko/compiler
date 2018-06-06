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
	%r7 = phi i32 [0, %L5], [%r10, %L6]
	%r8 = phi i32 [%n, %L5], [%r8, %L6]
	%r9 = add i32 %r7, %r8
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r9)
	%r10 = add i32 %r7, 1
	%r11 = mul i32 %r8, %r8
	%r12 = icmp slt i32 %r10, %r11
	%r13 = zext i1 %r12 to i32
	%r14 = trunc i32 %r13 to i1
	br i1 %r14, label %L6, label %L7

L7:
	%r15 = phi i32 [%n, %L5], [%r8, %L6]
	%r16 = sub i32 %r15, 1
	%r17 = call i32 @function(i32 %r16 )
	br label %L2
L2:
	%r18 = phi i32 [0, %L3], [%r17, %L7]
	ret i32 %r18
}

define i32 @main()
{

L9:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r19 = load i32, i32* @.read_scratch
	call i32 @function(i32 %r19 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 0)
	br label %L10
L10:
	ret i32 0
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8