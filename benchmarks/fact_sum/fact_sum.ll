target triple="i686"



define i32 @fact(i32 %n)
{

L4:
	%r2 = icmp eq i32 %n, 1
	%r3 = zext i1 %r2 to i32
	%r4 = icmp eq i32 %n, 0
	%r5 = zext i1 %r4 to i32
	%r6 = or i32 %r3, %r5
	%r7 = trunc i32 %r6 to i1
	br i1 %r7, label %L6, label %L7

L6:
	br label %L5
L7:
	br label %L8
L8:
	%r8 = icmp sle i32 %n, 1
	%r9 = zext i1 %r8 to i32
	%r10 = trunc i32 %r9 to i1
	br i1 %r10, label %L9, label %L10

L9:
	%r12 = mul i32 -1, %n
	%r13 = call i32 @fact(i32 %r12 )
	br label %L5
L10:
	br label %L11
L11:
	%r14 = sub i32 %n, 1
	%r15 = call i32 @fact(i32 %r14 )
	%r16 = mul i32 %n, %r15
	br label %L5
L5:
	%r17 = phi i32 [1, %L6], [%r13, %L9], [%r16, %L11]
	ret i32 %r17
}

define i32 @main()
{

L13:
	br i1 1, label %L15, label %L16

L15:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r22 = load i32, i32* @.read_scratch
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r23 = load i32, i32* @.read_scratch
	%r24 = call i32 @fact(i32 %r22 )
	%r25 = call i32 @fact(i32 %r23 )
	%r0 = add i32 %r24, %r25
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r0)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r27 = load i32, i32* @.read_scratch
	%r29 = icmp ne i32 %r27, -1
	%r30 = zext i1 %r29 to i32
	%r31 = trunc i32 %r30 to i1
	br i1 %r31, label %L15, label %L16

L16:
	br label %L14
L14:
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