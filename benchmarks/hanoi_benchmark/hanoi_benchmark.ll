target triple="i686"

%struct.plate = type {%struct.plate*, i32}
@peg1 = common global %struct.plate* null, align 8
@peg2 = common global %struct.plate* null, align 8
@peg3 = common global %struct.plate* null, align 8
@numMoves = common global i32 0, align 8

define void @move(i32 %from, i32 %to)
{

L1:
	%r0 = icmp eq i32 %from, 1
	%r1 = zext i1 %r0 to i32
	%r2 = trunc i32 %r1 to i1
	br i1 %r2, label %L3, label %L4

L3:
	%r3 = load %struct.plate*, %struct.plate** @peg1
	%r4 = load %struct.plate*, %struct.plate** @peg1
	%r5 = getelementptr %struct.plate , %struct.plate* %r4, i1 0, i32 0
	%r6 = load %struct.plate*, %struct.plate** %r5
	store %struct.plate* %r6, %struct.plate** @peg1
	br label %L5
L4:
	%r7 = icmp eq i32 %from, 2
	%r8 = zext i1 %r7 to i32
	%r9 = trunc i32 %r8 to i1
	br i1 %r9, label %L6, label %L7

L5:
	%r18 = phi i32 [%to, %L3], [%r19, %L8]
	%r24 = phi %struct.plate* [%r3, %L3], [%r25, %L8]
	%r20 = icmp eq i32 %r18, 1
	%r21 = zext i1 %r20 to i32
	%r22 = trunc i32 %r21 to i1
	br i1 %r22, label %L9, label %L10

L6:
	%r10 = load %struct.plate*, %struct.plate** @peg2
	%r11 = load %struct.plate*, %struct.plate** @peg2
	%r12 = getelementptr %struct.plate , %struct.plate* %r11, i1 0, i32 0
	%r13 = load %struct.plate*, %struct.plate** %r12
	store %struct.plate* %r13, %struct.plate** @peg2
	br label %L8
L7:
	%r14 = load %struct.plate*, %struct.plate** @peg3
	%r15 = load %struct.plate*, %struct.plate** @peg3
	%r16 = getelementptr %struct.plate , %struct.plate* %r15, i1 0, i32 0
	%r17 = load %struct.plate*, %struct.plate** %r16
	store %struct.plate* %r17, %struct.plate** @peg3
	br label %L8
L8:
	%r19 = phi i32 [%to, %L6], [%to, %L7]
	%r25 = phi %struct.plate* [%r10, %L6], [%r14, %L7]
	br label %L5
L9:
	%r23 = load %struct.plate*, %struct.plate** @peg1
	%r26 = getelementptr %struct.plate , %struct.plate* %r24, i1 0, i32 0
	store %struct.plate* %r23, %struct.plate** %r26
	store %struct.plate* %r24, %struct.plate** @peg1
	br label %L11
L10:
	%r27 = icmp eq i32 %r18, 2
	%r28 = zext i1 %r27 to i32
	%r29 = trunc i32 %r28 to i1
	br i1 %r29, label %L12, label %L13

L11:
	%r34 = load i32, i32* @numMoves
	%r35 = add i32 %r34, 1
	store i32 %r35, i32* @numMoves
	br label %L2
L12:
	%r30 = load %struct.plate*, %struct.plate** @peg2
	%r31 = getelementptr %struct.plate , %struct.plate* %r24, i1 0, i32 0
	store %struct.plate* %r30, %struct.plate** %r31
	store %struct.plate* %r24, %struct.plate** @peg2
	br label %L14
L13:
	%r32 = load %struct.plate*, %struct.plate** @peg3
	%r33 = getelementptr %struct.plate , %struct.plate* %r24, i1 0, i32 0
	store %struct.plate* %r32, %struct.plate** %r33
	store %struct.plate* %r24, %struct.plate** @peg3
	br label %L14
L14:
	br label %L11
L2:
	ret void
}

define void @hanoi(i32 %n, i32 %from, i32 %to, i32 %other)
{

L16:
	%r36 = icmp eq i32 %n, 1
	%r37 = zext i1 %r36 to i32
	%r38 = trunc i32 %r37 to i1
	br i1 %r38, label %L18, label %L19

L18:
	call void @move(i32 %from, i32 %to )
	br label %L20
L19:
	%r39 = sub i32 %n, 1
	call void @hanoi(i32 %r39, i32 %from, i32 %other, i32 %to )
	call void @move(i32 %from, i32 %to )
	%r40 = sub i32 %n, 1
	call void @hanoi(i32 %r40, i32 %other, i32 %to, i32 %from )
	br label %L20
L20:
	br label %L17
L17:
	ret void
}

define void @printPeg(%struct.plate* %peg)
{

L22:
	%r41 = icmp ne %struct.plate* %peg, null
	%r42 = zext i1 %r41 to i32
	%r43 = trunc i32 %r42 to i1
	br i1 %r43, label %L24, label %L25

L24:
	%r44 = phi %struct.plate* [%peg, %L22], [%r48, %L24]
	%r45 = getelementptr %struct.plate , %struct.plate* %r44, i1 0, i32 1
	%r46 = load i32, i32* %r45
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r46)
	%r47 = getelementptr %struct.plate , %struct.plate* %r44, i1 0, i32 0
	%r48 = load %struct.plate*, %struct.plate** %r47
	%r49 = icmp ne %struct.plate* %r48, null
	%r50 = zext i1 %r49 to i32
	%r51 = trunc i32 %r50 to i1
	br i1 %r51, label %L24, label %L25

L25:
	br label %L23
L23:
	ret void
}

define i32 @main()
{

L27:
	store %struct.plate* null, %struct.plate** @peg1
	store %struct.plate* null, %struct.plate** @peg2
	store %struct.plate* null, %struct.plate** @peg3
	store i32 0, i32* @numMoves
	call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.read, i32 0, i32 0), i32* @.read_scratch)
	%r52 = load i32, i32* @.read_scratch
	%r53 = icmp sge i32 %r52, 1
	%r54 = zext i1 %r53 to i32
	%r55 = trunc i32 %r54 to i1
	br i1 %r55, label %L29, label %L30

L29:
	%r56 = icmp ne i32 %r52, 0
	%r57 = zext i1 %r56 to i32
	%r58 = trunc i32 %r57 to i1
	br i1 %r58, label %L32, label %L33

L30:
	br label %L31
L31:
	br label %L28
L32:
	%r61 = phi i32 [%r52, %L29], [%r65, %L32]
	%r73 = phi i32 [%r52, %L29], [%r73, %L32]
	%r59 = call i8* @malloc(i32 16)
	%r60 = bitcast i8* %r59 to %struct.plate*
	%r62 = getelementptr %struct.plate , %struct.plate* %r60, i1 0, i32 1
	store i32 %r61, i32* %r62
	%r63 = load %struct.plate*, %struct.plate** @peg1
	%r64 = getelementptr %struct.plate , %struct.plate* %r60, i1 0, i32 0
	store %struct.plate* %r63, %struct.plate** %r64
	store %struct.plate* %r60, %struct.plate** @peg1
	%r65 = sub i32 %r61, 1
	%r66 = icmp ne i32 %r65, 0
	%r67 = zext i1 %r66 to i32
	%r68 = trunc i32 %r67 to i1
	br i1 %r68, label %L32, label %L33

L33:
	%r72 = phi i32 [%r52, %L29], [%r73, %L32]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	%r69 = load %struct.plate*, %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r69 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	%r70 = load %struct.plate*, %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r70 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	%r71 = load %struct.plate*, %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r71 )
	call void @hanoi(i32 %r72, i32 1, i32 3, i32 2 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	%r74 = load %struct.plate*, %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r74 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	%r75 = load %struct.plate*, %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r75 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	%r76 = load %struct.plate*, %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r76 )
	%r77 = load i32, i32* @numMoves
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r77)
	%r78 = load %struct.plate*, %struct.plate** @peg3
	%r79 = icmp ne %struct.plate* %r78, null
	%r80 = zext i1 %r79 to i32
	%r81 = trunc i32 %r80 to i1
	br i1 %r81, label %L34, label %L35

L34:
	%r82 = load %struct.plate*, %struct.plate** @peg3
	%r83 = load %struct.plate*, %struct.plate** @peg3
	%r84 = getelementptr %struct.plate , %struct.plate* %r83, i1 0, i32 0
	%r85 = load %struct.plate*, %struct.plate** %r84
	store %struct.plate* %r85, %struct.plate** @peg3
	%r86 = bitcast %struct.plate* %r82 to i8*
	call void @free(i8* %r86 )
	%r87 = load %struct.plate*, %struct.plate** @peg3
	%r88 = icmp ne %struct.plate* %r87, null
	%r89 = zext i1 %r88 to i32
	%r90 = trunc i32 %r89 to i1
	br i1 %r90, label %L34, label %L35

L35:
	br label %L31
L28:
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