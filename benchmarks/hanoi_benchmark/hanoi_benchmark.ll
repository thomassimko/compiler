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
	%phi0 = phi i32 [%to, %L3], [%phi1, %L8]
	%phi2 = phi %struct.plate* [%r3, %L3], [%phi3, %L8]
	%r18 = icmp eq i32 %phi0, 1
	%r19 = zext i1 %r18 to i32
	%r20 = trunc i32 %r19 to i1
	br i1 %r20, label %L9, label %L10

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
	%phi1 = phi i32 [%to, %L6], [%to, %L7]
	%phi3 = phi %struct.plate* [%r10, %L6], [%r14, %L7]
	br label %L5
L9:
	%r21 = load %struct.plate*, %struct.plate** @peg1
	%r22 = getelementptr %struct.plate , %struct.plate* %phi2, i1 0, i32 0
	store %struct.plate* %r21, %struct.plate** %r22
	store %struct.plate* %phi2, %struct.plate** @peg1
	br label %L11
L10:
	%r23 = icmp eq i32 %phi0, 2
	%r24 = zext i1 %r23 to i32
	%r25 = trunc i32 %r24 to i1
	br i1 %r25, label %L12, label %L13

L11:
	%r30 = load i32, i32* @numMoves
	%r31 = add i32 %r30, 1
	store i32 %r31, i32* @numMoves
	br label %L2
L12:
	%r26 = load %struct.plate*, %struct.plate** @peg2
	%r27 = getelementptr %struct.plate , %struct.plate* %phi2, i1 0, i32 0
	store %struct.plate* %r26, %struct.plate** %r27
	store %struct.plate* %phi2, %struct.plate** @peg2
	br label %L14
L13:
	%r28 = load %struct.plate*, %struct.plate** @peg3
	%r29 = getelementptr %struct.plate , %struct.plate* %phi2, i1 0, i32 0
	store %struct.plate* %r28, %struct.plate** %r29
	store %struct.plate* %phi2, %struct.plate** @peg3
	br label %L14
L14:
	br label %L11
L2:
	ret void
}

define void @hanoi(i32 %n, i32 %from, i32 %to, i32 %other)
{

L16:
	%r32 = icmp eq i32 %n, 1
	%r33 = zext i1 %r32 to i32
	%r34 = trunc i32 %r33 to i1
	br i1 %r34, label %L18, label %L19

L18:
	call void @move(i32 %from, i32 %to )
	br label %L20
L19:
	%r35 = sub i32 %n, 1
	call void @hanoi(i32 %r35, i32 %from, i32 %other, i32 %to )
	call void @move(i32 %from, i32 %to )
	%r36 = sub i32 %n, 1
	call void @hanoi(i32 %r36, i32 %other, i32 %to, i32 %from )
	br label %L20
L20:
	br label %L17
L17:
	ret void
}

define void @printPeg(%struct.plate* %peg)
{

L22:
	%r37 = icmp ne %struct.plate* %peg, null
	%r38 = zext i1 %r37 to i32
	%r39 = trunc i32 %r38 to i1
	br i1 %r39, label %L24, label %L25

L24:
	%phi4 = phi %struct.plate* [%peg, %L22], [%r43, %L24]
	%r40 = getelementptr %struct.plate , %struct.plate* %phi4, i1 0, i32 1
	%r41 = load i32, i32* %r40
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r41)
	%r42 = getelementptr %struct.plate , %struct.plate* %phi4, i1 0, i32 0
	%r43 = load %struct.plate*, %struct.plate** %r42
	%r44 = icmp ne %struct.plate* %r43, null
	%r45 = zext i1 %r44 to i32
	%r46 = trunc i32 %r45 to i1
	br i1 %r46, label %L24, label %L25

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
	%r47 = load i32, i32* @.read_scratch
	%r48 = icmp sge i32 %r47, 1
	%r49 = zext i1 %r48 to i32
	%r50 = trunc i32 %r49 to i1
	br i1 %r50, label %L29, label %L30

L29:
	%r51 = icmp ne i32 %r47, 0
	%r52 = zext i1 %r51 to i32
	%r53 = trunc i32 %r52 to i1
	br i1 %r53, label %L32, label %L33

L30:
	br label %L31
L31:
	br label %L28
L32:
	%phi5 = phi i32 [%r47, %L29], [%r59, %L32]
	%phi7 = phi i32 [%r47, %L29], [%phi7, %L32]
	%r54 = call i8* @malloc(i32 16)
	%r55 = bitcast i8* %r54 to %struct.plate*
	%r56 = getelementptr %struct.plate , %struct.plate* %r55, i1 0, i32 1
	store i32 %phi5, i32* %r56
	%r57 = load %struct.plate*, %struct.plate** @peg1
	%r58 = getelementptr %struct.plate , %struct.plate* %r55, i1 0, i32 0
	store %struct.plate* %r57, %struct.plate** %r58
	store %struct.plate* %r55, %struct.plate** @peg1
	%r59 = sub i32 %phi5, 1
	%r60 = icmp ne i32 %r59, 0
	%r61 = zext i1 %r60 to i32
	%r62 = trunc i32 %r61 to i1
	br i1 %r62, label %L32, label %L33

L33:
	%phi6 = phi i32 [%r47, %L29], [%phi7, %L32]
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	%r63 = load %struct.plate*, %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r63 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	%r64 = load %struct.plate*, %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r64 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	%r65 = load %struct.plate*, %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r65 )
	call void @hanoi(i32 %phi6, i32 1, i32 3, i32 2 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 1)
	%r66 = load %struct.plate*, %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r66 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 2)
	%r67 = load %struct.plate*, %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r67 )
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 3)
	%r68 = load %struct.plate*, %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r68 )
	%r69 = load i32, i32* @numMoves
	call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.println, i32 0, i32 0), i32 %r69)
	%r70 = load %struct.plate*, %struct.plate** @peg3
	%r71 = icmp ne %struct.plate* %r70, null
	%r72 = zext i1 %r71 to i32
	%r73 = trunc i32 %r72 to i1
	br i1 %r73, label %L34, label %L35

L34:
	%r74 = load %struct.plate*, %struct.plate** @peg3
	%r75 = load %struct.plate*, %struct.plate** @peg3
	%r76 = getelementptr %struct.plate , %struct.plate* %r75, i1 0, i32 0
	%r77 = load %struct.plate*, %struct.plate** %r76
	store %struct.plate* %r77, %struct.plate** @peg3
	%r78 = bitcast %struct.plate* %r74 to i8*
	call void @free(i8* %r78 )
	%r79 = load %struct.plate*, %struct.plate** @peg3
	%r80 = icmp ne %struct.plate* %r79, null
	%r81 = zext i1 %r80 to i32
	%r82 = trunc i32 %r81 to i1
	br i1 %r82, label %L34, label %L35

L35:
	br label %L31
L28:
	%phi8 = phi i32 [0, %L31]
	ret i32 %phi8
}

declare i8* @malloc(i32)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i32 0, align 8