target triple="i686"



define void @hailstone(i32 %n)
{

L4:
	br i1 1, label %L6, label %L7

L6:
	%r6 = phi i32 [%n, %L4], [%r14, %L13]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r6)
	%r2 = sub i32 %r6, 4
	%r8 = icmp eq i32 %r2, 1
	%r9 = zext i1 %r8 to i32
	%r10 = trunc i32 %r9 to i1
	br i1 %r10, label %L8, label %L9

L8:
	%r11 = mul i32 3, %r6
	%r12 = add i32 %r11, 1
	br label %L10
L9:
	%r13 = sdiv i32 %r6, 2
	br label %L10
L10:
	%r14 = phi i32 [%r12, %L8], [%r13, %L9]
	%r15 = icmp sle i32 %r14, 1
	%r16 = zext i1 %r15 to i32
	%r17 = trunc i32 %r16 to i1
	br i1 %r17, label %L11, label %L12

L11:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r14)
	br label %L5
L12:
	br label %L13
L13:
	br i1 1, label %L6, label %L7

L7:
	br label %L5
L5:
	ret void
}

define i32 @main()
{

L15:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r20 = load i32, i32* @.read_scratch
	call void @hailstone(i32 %r20 )
	br label %L16
L16:
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