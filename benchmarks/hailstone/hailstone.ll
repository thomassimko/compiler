target triple="i686"



define i32 @mod(i32 %a, i32 %b)
{

L1:
	%r0 = sdiv i32 %a, %b
	%r1 = mul i32 %r0, %b
	%r2 = sub i32 %a, %r1
	br label %L2
L2:
	%phi0 = phi i32 [%r2, %L1]
	ret i32 %phi0
}

define void @hailstone(i32 %n)
{

L4:
	%r3 = zext i1 1 to i32
	%r4 = trunc i32 %r3 to i1
	br i1 %r4, label %L6, label %L7

L6:
	%phi1 = phi i32 [%n, %L4], [%phi2, %L13]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %phi1)
	%r5 = call i32 @mod(i32 %phi1, i32 2 )
	%r6 = icmp eq i32 %r5, 1
	%r7 = zext i1 %r6 to i32
	%r8 = trunc i32 %r7 to i1
	br i1 %r8, label %L8, label %L9

L8:
	%r9 = mul i32 3, %phi1
	%r10 = add i32 %r9, 1
	br label %L10
L9:
	%r11 = sdiv i32 %phi1, 2
	br label %L10
L10:
	%phi2 = phi i32 [%r10, %L8], [%r11, %L9]
	%r12 = icmp sle i32 %phi2, 1
	%r13 = zext i1 %r12 to i32
	%r14 = trunc i32 %r13 to i1
	br i1 %r14, label %L11, label %L12

L11:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %phi2)
	br label %L5
L12:
	br label %L13
L13:
	%r15 = zext i1 1 to i32
	%r16 = trunc i32 %r15 to i1
	br i1 %r16, label %L6, label %L7

L7:
	br label %L5
L5:
	ret void
}

define i32 @main()
{

L15:
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r17 = load i32, i32* @.read_scratch
	call void @hailstone(i32 %r17 )
	br label %L16
L16:
	%phi3 = phi i32 [0, %L15]
	ret i32 %phi3
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8