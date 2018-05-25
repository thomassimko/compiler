target triple="i686"

@y = common global i32 0, align 8

define void @foo(i32 %x)
{

L1:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 96)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 4)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 7)
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 28)
	%r7 = sdiv i32 4, 0
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r7)
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r8 = load i32, i32* @.read_scratch
	%r9 = add i32 %r8, 1
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.print, i32 0, i32 0), i32 %r9)
	br label %L2
L2:
	ret void
}

define i32 @bar(i32 %x, i32 %y)
{

L4:
	%r10 = icmp sgt i32 %x, %y
	%r11 = zext i1 %r10 to i32
	%r12 = trunc i32 %r11 to i1
	br i1 %r12, label %L6, label %L7

L6:
	br label %L8
L7:
	br label %L8
L8:
	br label %L5
L5:
	ret i32 5
}

define i32 @baz(i32 %x, i32 %y)
{

L10:
	%r18 = icmp sgt i32 %x, %y
	%r19 = zext i1 %r18 to i32
	%r20 = trunc i32 %r19 to i1
	br i1 %r20, label %L12, label %L13

L12:
	br label %L14
L13:
	br label %L14
L14:
	br i1 1, label %L15, label %L16

L15:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	br label %L17
L16:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	br label %L17
L17:
	br i1 0, label %L18, label %L19

L18:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	br label %L20
L19:
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 4)
	br label %L20
L20:
	br label %L11
L11:
	ret i32 0
}

define void @fbool(i32 %b)
{

L22:
	br label %L23
L23:
	ret void
}

define i32 @quux(i32 %x, i32 %y)
{

L25:
	%r35 = icmp sgt i32 %x, %y
	%r36 = zext i1 %r35 to i32
	%r37 = trunc i32 %r36 to i1
	br i1 %r37, label %L27, label %L28

L27:
	br label %L29
L28:
	br label %L29
L29:
	call void @fbool(i32 0 )
	call void @fbool(i32 1 )
	call void @fbool(i32 1 )
	call void @fbool(i32 1 )
	call void @fbool(i32 0 )
	call void @fbool(i32 0 )
	call void @fbool(i32 1 )
	call void @fbool(i32 1 )
	br label %L26
L26:
	ret i32 0
}

define i32 @quux2(i32 %x, i32 %y)
{

L31:
	%r58 = icmp sgt i32 %x, %y
	%r59 = zext i1 %r58 to i32
	%r60 = trunc i32 %r59 to i1
	br i1 %r60, label %L33, label %L34

L33:
	br label %L35
L34:
	br label %L35
L35:
	call void @fbool(i32 0 )
	call void @fbool(i32 1 )
	call void @fbool(i32 1 )
	call void @fbool(i32 1 )
	call void @fbool(i32 0 )
	call void @fbool(i32 0 )
	call void @fbool(i32 1 )
	call void @fbool(i32 1 )
	br label %L32
L32:
	ret i32 0
}

define i32 @flrgrl(i32 %x, i32 %y)
{

L37:
	%r82 = icmp sgt i32 %x, %y
	%r83 = zext i1 %r82 to i32
	%r84 = trunc i32 %r83 to i1
	br i1 %r84, label %L39, label %L40

L39:
	br label %L41
L40:
	br label %L41
L41:
	br label %L38
L38:
	ret i32 4
}

define i32 @blergh()
{

L43:
	br i1 1, label %L45, label %L46

L45:
	br label %L47
L46:
	br label %L47
L47:
	%r92 = phi i32 [3, %L45], [1, %L46]
	br label %L44
L44:
	%r93 = phi i32 [%r92, %L47]
	ret i32 %r93
}

define i32 @main()
{

L49:
	br label %L50
L50:
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