 %***************************************************************************%
 %                                                                           %
 %  This link grammar system is copyright (C) 1991-1997 by Daniel Sleator    %
 %  (sleator@cs.cmu.edu) and Davy Temperley.  This is work in progress.      %
 %  See http://www.cs.cmu.edu/~sleator for announcements of the latest       %
 %  version, detailed documentation, and rules for commercial use.           %
 %                                                                           %
 %***************************************************************************%

 % _ORGANIZATION OF THE DICTIONARY_
 % 
 % I. NOUNS
 % II. PRONOUNS
 % III. DETERMINERS
 % IV. NUMERICAL EXPRESSIONS
 % V. VERBS
 %    A. Auxiliaries; B. Common verb types; C. complex intransitive verbs; 
 %    D. complex intransitive verbs; E. complex verbs taking [obj] + 
 %    [complement]; F. idiomatic verbs
 % VI. PREPOSITIONS
 % VII. TIME AND PLACE EXPRESSIONS
 % VIII. QUESTION-WORDS AND CONJUNCTIONS
 % IX. ADJECTIVES
 % X. ADVERBS
 % XI. COMPARATIVES AND SUPERLATIVES
 % XII. MISCELLANEOUS WORDS AND PUNCTUATION 


% NOUNS

<CLAUSE> : {({@COd-} & C-) or ({@CO-} & (Wd- & {CC+})) or R-};
			% save writing. Note that 
			% a clause is unable to make a CO connection only!

<S-CLAUSE> : {({@COd-} & C-) or ({@CO-} & (Wd- & {CC+}))}; 
					% used on special subjects like 
                                        %"to" and "that" phrases

<CLAUSE-E>: {({@COd-} & C-) or ({@CO-} & (Wd- or {CC+})) or Re-};

<noun-main-x>: (S+ & <CLAUSE>) or SI- or J- or O- or (Xd- & Xc+ & MX-);
<noun-main-s>: (Ss+ & <CLAUSE>) or SIs- or Js- or Os- or ({[Bsj+]} & Xd-
 & Xc+ & MX-);
<noun-main-p>: (Sp+ & <CLAUSE>) or SIp- or Jp- or Op- or ({[Bpj+]} & Xd-
 & Xc+ & MX-) ;
<noun-main-m>: (Ss+ & <CLAUSE>) or SIs- or Jp- or Os- or ({[Bsj+]} & Xd- 
& Xc+ & MX-) ;
<noun-main-h>: (Ss*b+ & <CLAUSE>) or SIs*b- or Js- or Os- or ({[B*j+]} 
& Xd- & Xc+ & MX-) ;

<noun-sub-x>: {@M+} & {R+ & B+ & {[[@M+]]}} & {@MX+};
<noun-sub-s>: {@M+} & {R+ & Bs+ & {[[@M+]]}} & {@MXs+};
<noun-sub-p>: {@M+} & {R+ & Bp+ & {[[@M+]]}} & {@MXp+};


CAPITALIZED-WORDS: 
{G-} & {Xi+} & (({DG- or [[GN-]] or [[{@A-} & {D-}]]} & {Xi+} &
(({MG+} & {@MX+} & (JG- or <noun-main-s> or [[(Sp+ & <CLAUSE>) or SIp-]]))
 or ({[[MG+]]} & (YS+ or YP+)))) or (AN+ or G+));
% the generic category for words with a capitalized first character

words/words.n.p:
({G-} & {DG- or [[GN-]] or [[{@A-} & {D-}]]} & 
(({MG+} & {@MX+} & (JG- or <noun-main-s>)) or 
({[[MG+]]} & (AN+ or YS+ or YP+)))) or ({G-} & (AN+ or G+));

I.n: [[{Xi+} & {G-} & G+]];

HYPHENATED-WORDS: ({EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or 
(Pa- & {@MV+}))) or [[AN+]]
or [[({@AN-} & {@A-} & (({D-} & <noun-sub-x> & (<noun-main-x> or B*m+)) or
 U-)) or ((YS+ or YP+) & {@AN-} & {@A-} & {D-})]];
% the generic category for strings containing a hyphen

words/words.n.1:  % dog
 ({@AN-} & {@A- & {[[@AN-]]}} & 
((Ds- & <noun-sub-s> & (<noun-main-s> or Bsm+))
or (YS+ & Ds-) or (GN+ & (DD- or [()])) or Us-)) or AN+;

words/words.n.2.s:  % dogs, and other plural nouns that end in "s".
 ({@AN-} & {@A- & {[[@AN-]]}} & (({Dmc-} & <noun-sub-p> & 
(<noun-main-p> or Bpm+))
or (YP+ & {Dmc-}) or (GN+ & (DD- or [()])) or Um-)) or [[AN+]];

words/words.n.2.x:  % men, and other plural nouns that don't end in "s".
 ({@AN-} & {@A- & {[[@AN-]]}} & (({Dmc-} & <noun-sub-p> & 
(<noun-main-p> or Bpm+))
or (YS+ & {Dmc-}) or (GN+ & (DD- or [()])) or Up-)) or [[AN+]];

words/words.n.3:  % water
({@AN-} & {@A- & {[[@AN-]]}} & (({Dmu-} & <noun-sub-s> & 
(<noun-main-m> or Bsm+)) 
or (YS+ & {Dmu-}) or (GN+ & (DD- or [()])) or Us-)) or AN+;

words/words.n.4:  % war winter action
({@AN-} & {@A- & {[[@AN-]]}} & (({D*u-} & <noun-sub-s> & 
(<noun-main-m> or Bsm+)) or 
(YS+ & {D*u-}) or (GN+ & (DD- or [()])) or Us-)) or AN+;

words/words.n.c.1: % nouns that are sometimes capitalized
 ({@AN-} & {@A- & {[[@AN-]]}} & (((Ds- or [[()]]) & <noun-sub-s> & 
(<noun-main-s> or Bsm+))
or (YS+ & Ds-) or (GN+ & (DD- or [()])) or Us-)) or AN+ or ({G-} & G+);

words/words.n.c.2: % plural capitalized nouns
 ({@AN-} & {@A- & {[[@AN-]]}} & (({Dmc-} & <noun-sub-p> & 
(<noun-main-p> or Bpm+))
or (YP+ & {Dmc-}) or (GN+ & (DD- or [()])) or Up-)) or [[AN+]];

words/words.s: % US state names and abbreviations
({G-} & {DG- or [[GN-]] or [[{@A-} & {D-}]]} & 
(({MG+} & {@MX+} & (JG- or <noun-main-s>)) or G+ or 
({[[MG+]]} & (AN+ or YS+ or YP+)))) or (Xc+ & Xd- & G- & AN+);

alter_ego au_pair mise_en_scene faux_pas non_sequitur fait_accompli
modus_vivendi head_of_state: % sing noun idioms
 ({@AN-} & {@A- & {[[@AN-]]}} & ((Ds- & <noun-sub-s> & 
(<noun-main-s> or Bsm+))
or Us- or (YS+ & Ds-) or (GN+ & (DD- or [()])))) or AN+;

kung_fu joie_de_vivre op_art noblesse_oblige lese_majesty
time_of_day time_of_year force_majeure top_dollar year_end skim_milk
breach_of_contract sleight_of_hand power_of_attorney word_of_mouth: 
% mass noun idioms
({@AN-} & {@A- & {[[@AN-]]}} & (({Dmu-} & <noun-sub-s> & 
(<noun-main-m> or Bsm+)) or
Us- or (YS+ & {Dmu-}) or (GN+ & (DD- or [()])))) or AN+;

president.i chairman.i chairwoman.i director.i chief.i professor.i
leader.i coordinator.i Democrat.i Republican.i comptroller.i governor.i
manager.i analyst.i secretary.i officer.i administrator.i head.i
executive.i editor.i owner.i:
{@AN-} & {@A- & {[[@AN-]]}} & {@M+} & (BI- or (Xd- & Xc+ & MX-) or TI-);

majority minority number.n bunch.n batch.n bulk handful.n:
 ({@AN-} & {@A- & {[[@AN-]]}} & ((Ds- & <noun-sub-x> &
(<noun-main-x> or B*x+))
or Us- or (YS+ & Ds-) or (GN+ & (DD- or [()])))) or AN+;

flight.i age.i: {@AN-} & NIa+ & <noun-main-s>;

kind_of type_of sort_of:
 {{@AN-} & @A-} & U+ & ((Ds- & <noun-sub-s> &
(<noun-main-s> or Bsm+)) or Us-);
kinds_of types_of sorts_of:
 {{@AN-} & @A-} & U+ & (({Dmc-} & <noun-sub-p> & 
(<noun-main-p> or Bpm+)) or Up-);

percent.s: 
({@AN-} & {@A- & {[[@AN-]]}} & ((ND- & {DD-} & <noun-sub-x> & 
(<noun-main-x> or B*x+)) or
U-)) or (ND- & (OD- or AN+ or YS+));

argument report.n sign.n impression conclusion complaint allegation 
announcement position.n restriction threat
realization notion remark.n assertion proclamation reassurance 
saying.n accusation possibility idea problem claim.n result.n 
statement hunch.n assumption concept hypothesis implication
recommendation message view.n premonition prerequisite
proviso truism fallacy proposition.n stipulation prospect
presupposition inkling supposition finding.n amount.n: 
({@AN-} & {@A- & {[[@AN-]]}} & ((Ds- & {@M+} & {(TH+ or (R+ & Bs+)) & 
{[[@M+]]}} & {@MXs+} & (Js- or Os- or (Ss*t+ & <CLAUSE>) or SIs*t- or 
(Xc+ & Xd- & MXs-) or Bsm+)) or Us- or (YS+ & Ds-) or 
(GN+ & (DD- or [()])))) or AN+;
evidence proof.n doubt.n suspicion hope.n knowledge relief likelihood
reasoning.n disclosure fear.n acknowledgment acknowledgement principle
concern.n philosophy risk.n understanding.n conviction theory
assurance speculation.n awareness.n news opinion belief contention
thought.n myth discovery rumor probability fact explanation feeling.n
comment.n expectation perception sense.n provision.n 
insistence consensus notification rule.n:  %check for mass only
({@AN-} & {@A- & {[[@AN-]]}} & (({D*u-} & {@M+} & {(TH+ or (R+ & Bs+)) 
& {[[@M+]]}} & {@MXs+} & (Jp- or Os- or (Ss*t+ & <CLAUSE>) or SIs*t- or 
(Xd- & Xc+ & MXs-) or Bsm+))
 or Us- or (YS+ & {D*u-}) or (GN+ & (DD- or [()])))) or AN+;  

ideas opinions statements beliefs facts arguments principles theories
philosophies signs.n impressions conclusions contentions complaints proofs.n
doubts.n suspicions allegations reports.n claims.n announcements positions.n
risks.n hopes.n explanations restrictions threats thoughts.n myths feelings
discoveries rumors comments.n realizations probabilities
remarks.n notions convictions hunches.n assumptions concepts hypotheses
assertions expectations implications perceptions proclamations reassurances
recommendations fears.n sayings.n senses.n messages disclosures accusations
views.n concerns.n understandings.n acknowledgments acknowledgements
possibilities preominitions prerequisites provisos truisms fallacies
assurances speculations propositions.n provisions.n stipulations
prospects presuppositions inklings suppositions findings.n amounts.n rules.n:
({@AN-} & {@A- & {[[@AN-]]}} & (({Dmc-} & {@M+} & {(TH+ or (R+ & Bp+)) & 
{[[@M+]]}} & {@MXp+} &
(Jp- or Op- or (Sp*t+ & <CLAUSE>) or SIp*t- or (Xc+ & Xd- & MXp-) or Bpm+)) 
or Up- or (YP+ & {Dmc-}) or (GN+ & (DD- or [()])))) or [[AN+]];

excuse.n decision proposal attempt.n plan.n
pledge.n urge.n mission right.n desire.n mandate.n promise.n option 
campaign.n offer.n obligation vow.n permit.n impetus
proclivity propensity move.n:
({@AN-} & {@A- & {[[@AN-]]}} & ((Ds- & {@M+} & {(TOn+ or (R+ & Bs+)) & 
{[[@M+]]}} & {@MXs+} & (<noun-main-s> or Bsm+)) or
 Us- or (YS+ & Ds-) or (GN+ & (DD- or [()])))) or AN+;
failure haste refusal reluctance pressure.n willingness responsibility
intent.n temptation readiness effort determination capacity unwillingness
need.n will.n eagerness opportunity commitment ambition ability order.n:
({@AN-} & {@A- & {[[@AN-]]}} & (({D*u-} & {@M+} & {(TOn+ or (R+ & Bs+)) & 
{[[@M+]]}} & {@MXs+} & (<noun-main-m> or Bsm+)) or
 Us- or (YS+ & {D*u-}) or (GN+ & (DD- or [()])))) or AN+;
excuses.n decisions proposals failures efforts attempts.n refusals pledges.n
urges.n missions rights.n desires.n needs.n ambitions.n capacities mandates.n
promises.n abilities options commitments intents opportunities plans.n
responsibilities chances campaigns.n offers.n pressures.n obligations orders.n
temptations vows.n permits.n impetuses proclivities propensities moves.n:
({@AN-} & {@A- & {[[@AN-]]}} & (({Dmc-} & {@M+} & {(TOn+ or (R+ & Bp+)) &
 {[[@M+]]}} & {@MXp+} & (<noun-main-p> or Bpm+)) or
 Up- or (YP+ & {Dmc-}) or (GN+ & (DD- or [()])))) or [[AN+]];
chance:
({@AN-} & {@A- & {[[@AN-]]}} & ((Ds- & {@M+} & {(TOn+ or TH+ or (R+ & Bs+)) 
& {[[@M+]]}} & {@MXs+} & (<noun-main-s> or Bsm+)) or 
 Us- or (YS+ & Ds-) or (GN+ & (DD- or [()])))) or AN+;
question.n issue.n: 
({@AN-} & {@A- & {[[@AN-]]}} & ((Ds- & {@M+} & {R+ & Bs+ & {[[@M+]]}} & 
{@MXs+} &
(Js- or Os- or (Ss*q+ & <CLAUSE>) or SIs*q- or (Xc+ & Xd- & MXs-) or Bsm+)) 
or Us- or (YS+ & Ds-) or (GN+ & (DD- or [()])))) or AN+;
questions.n issues.n:
({@AN-} & {@A- & {[[@AN-]]}} & (({Dmc-} & {@M+} & {R+ & Bp+ & {[[@M+]]}} & 
{@MXp+} &
(Jp- or Op- or (Sp*q+ & <CLAUSE>) or SIp*q- or (Xc+ & Xd- & MXp-) 
or Bpm+)) or Up- or (YP+ & {Dmc-}) or (GN+ & (DD- or [()])))) or AN+;
day.n week.n moment.n hour.n minute.n year.n instant.n period month.n night.n
second.n decade.n century.n:
({@AN-} & {@A- & {[[@AN-]]}} & ((Ds- & {@M+} &
{WN+ or TH+ or Ce+ or (R+ & (Bs+ or Ce+))} & {@MXs+} & 
(<noun-main-s> or Bsm+)) or 
 Us- or (YS+ & Ds-) or (GN+ & (DD- or [()])))) or AN+;
days.n weeks.n moments.n hours.n minutes.n years.n instants periods months.n
nights.n seconds.n decades.n centuries.n:
({@AN-} & {@A- & {[[@AN-]]}} & (({Dmc-} & {@M+} & {WN+ or TH+ or Ce+ or 
(R+ & (Bp+ or Ce+))}  & {@MXp+} & (<noun-main-p> or Bpm+)) 
or Up- or (YP+ & {Dmc-}) or (GN+ & (DD- or [()])))) or [[AN+]];
reason.n:
({@AN-} & {@A- & {[[@AN-]]}} & (({D*u-} & {@M+} & {TH+ or Ce+ or TOn+ or 
WY+ or (R+ & Bs+)} & {@MXs+} & (Js- or Os- or (Ss*t+ & <CLAUSE>) 
or SIs*t- or (Xc+ & Xd- & MXs-) or Bsm+)) or Us- or 
(YS+ & {D*u-}) or (GN+ & (DD- or [()])))) or AN+;

reasons.n:
({@AN-} & {@A- & {[[@AN-]]}} & (({Dmc-} & {@M+} & {TH+ or Ce+ or TOn+ or
 WY+ or (R+ & Bp+)} & {@MXp+} & (<noun-main-p> or Bpm+))
 or Up- or (YP+ & {Dmc-}) or (GN+ & (DD- or [()])))) or [[AN+]];
way:
({@AN-} & {@A- & {[[@AN-]]}} & ((Ds- & {@M+} & {TOn+ or TH+ or Ce+ or 
(R+ & Bs+)} & {@MXs+} & (MVa- or <noun-main-s> or Bsm+))
or Us- or (YS+ & {D*u-}) or (GN+ & (DD- or [()])))) or AN+;
place.n:
({@AN-} & {@A- & {[[@AN-]]}} & ((Ds- & {@M+} & {TOn+ or TH+ or Ce+ or 
(R+ & Bs+)} & {@MXs+} & (<noun-main-s> or Bsm+))
or Us- or (YS+ & {D*u-}) or (GN+ & (DD- or [()])))) or AN+;
time.n:
({@AN-} & {@A- & {[[@AN-]]}} & (({D*u-} & {@M+} & {TOn+ or WN+ or TH+ or 
Ce+ or (R+ & Bs+)} & {@MXs+} & (<noun-main-m> or Bsm+))
or Us- or (YS+ & {D*u-}) or (GN+ & (DD- or [()])))) or AN+;
ways:
({@AN-} & {@A- & {[[@AN-]]}} & (({Dmc-} & {@M+} & {TOn+ or TH+ or Ce+ or 
(R+ & Bp+)} & {@MXp+} & (MVa- or <noun-main-p> or Bpm+))
or Up- or (YP+ & {Dmc-}) or (GN+ & (DD- or [()])))) or [[AN+]];
places.n:
({@AN-} & {@A- & {[[@AN-]]}} & (({Dmc-} & {@M+} & {TOn+ or TH+ or Ce+ or 
(R+ & Bp+)} & {@MXp+} & (<noun-main-p> or Bpm+))
 or Up- or (YP+ & {Dmc-}) or (GN+ & (DD- or [()])))) or [[AN+]];
times.n:
({@AN-} & {@A- & {[[@AN-]]}} & (({Dmc-} & {@M+} & {TOn+ or WN+ or TH+ or 
Ce+ or (R+ & Bp+)} & {@MXp+} & (<noun-main-p> or Bpm+))
 or Up- or (YP+ & {Dmc-}) or (GN+ & (DD- or [()])))) or [[AN+]];


%PRONOUNS

she he: ({[[R+ & Bs+]]} & ((Ss+ & <CLAUSE>) or SIs-));
me him them us: J- or Ox-;
myself yourself himself herself itself themselves
ourselves yourselves: J- or O- or E+ or MVa-;
each_other: J- or O- or YS+;
her: ({AL-} & {@L+} & D+) or J- or Ox- or DD+ or DP+;
its my your their our: DD+ or ({AL-} & {@L+} & D+) or DP+;
his: DD+ or DP+ or ({AL-} & {@L+} & D+) or
[(J- or O- or (S+ & <CLAUSE>) or SI- or 
Xb-)];
you: J- or Ox- or (Sp+ & <CLAUSE>) or SIp-;
it: J- or Ox- or ((Ss*b+ or SFsi+) & <CLAUSE>) or SIs*b- or 
SFIsi- or OXi-;
they: {R+ & Bp+} & ((Sp+ & <CLAUSE>) or SIp-);
we: (Sp+ & <CLAUSE>) or SIp-;
I.p: (Sp*i+ & <CLAUSE>) or SIp*i-;
it_all them_all us_all you_all: Ox- or J-;

we're they're I'm you're: 
{N+} & (Pa+ or ({@EBm+} & (O*t+ or Mp+) & {@MV+}) or Pg+ or Pv+ or 
TO+ or TH+) & <CLAUSE>;
I've they've you've we've: PP+ & <CLAUSE>;
we'd they'd I'd he'd she'd you'd: (PP+ or ({Vw+} & I+)) & <CLAUSE>;
I'll he'll she'll we'll they'll you'll: I+ & <CLAUSE>;

something someone somebody:
{EL+} & (({Pa+} & <noun-sub-s> & {@MXs+} & <noun-main-s>) or YS+);
everything nothing anything everyone anyone everybody no_one
nobody anybody : {EN-} & {EL+} & (({Pa+} & <noun-sub-s> & {@MXs+} &
<noun-main-s>) or YS+);
nothing_but: Vd- & I+;
else: EL-;

others: {Dmc-} & <noun-sub-p> & <noun-main-p>;
mine.p yours theirs hers ours: <noun-main-x>;


% DETERMINERS

the: ({AL-} & {@L+} & (D+ or DD+)) or DG+ or (TR- & U+);
those: ({AL-} & (Dmc+ or DD+)) or 
(<noun-sub-p> & <noun-main-p>);
this: <noun-main-h> or ({AL-} & D*u+) or DTn+;
these: <noun-main-p> or ({AL-} & (Dmc+ or DD+));
both: Dmc+ or E+ or ({M+ or (ALx+ & Jp+)} & <noun-main-p>);
half: {EN-} & (NJ+ or ((({DD-} & {@Mp+ or (R+ & B+)}) or (AL+ & J+))
& <noun-main-x>));
many: (H- & (Dmc+ or ND+ or TQ+)) or (AM- & Dmcz+) or 
({EE-} & ND+) or 
({DD-} & {EAx-} & Dmc+) or ((({EAx-} & {DD-}) or H-) & 
<noun-sub-p> & (<noun-main-p> or Bpm+));
all: {EN-} & (E+ or Dm+ or NIc+ or 
({@M+ or (ALx+ & Jp+) or (R+ & B+)} & <noun-main-x>));
all_that: EA+ or EE+ or (<noun-sub-s>
 & <noun-main-s>);
all_this: <noun-sub-s> & <noun-main-s>;
all_those all_these: <noun-sub-p> & <noun-main-p>;
one: NN+ or ({EN-} & (Ds+ or ({{@A- & {[[@AN-]]}} & Ds-} & 
<noun-sub-s> & (<noun-main-s> or Bsm+)))) or NS+;
% The one dog died? Add {DD-} & Ds+
ones: {@A- & {[[@AN-]]}} & {Dmc-} & <noun-sub-p> & <noun-main-p>;
any: ({EN-} & (D+ or DD+ or 
(<noun-sub-x> & <noun-main-x>))) or EC+;
a an: ({(AA- & HA-) or ALa-} & Ds+) or NN+ or ([[Mp- & Us+]]) or NS+;
such: (ND- & Dmc+) or Dm*k+;
such_a such_an: Ds*k+;
quite_a quite_an one_such: Ds+;
a_lot: (<noun-sub-p> & <noun-main-p>) or EC+ or MVa-;
few: {EA- or EF+ or ({EA-} & DD-)} & 
 (Dmc+ or (<noun-sub-p> & <noun-main-p>));
a_couple: <noun-sub-p> & <noun-main-p>;
a_couple_of: NN+ or ND+;
a_few: NN+ or ND+ or ({EN-} & (Dmc+ or ND+ or 
(<noun-sub-p> & <noun-main-p>)));
some: D+ or EN+ or
(<noun-sub-x> & <noun-main-x>);
little.i: ({EE-} & (MVa- or Ca+ or Qe+)) or ({EEx- or H-} & (Dmu+ or 
(<noun-sub-s> & (<noun-main-s> or Bsm+))))
or (AM- & (Dmuy+ or MVy- or Oy- or Jy-));
most: Dm+ or [EE+] or EA+ or
(<noun-sub-x> & <noun-main-x>);
part.i: OF+ & <noun-main-s>;

the_most: MVa- or EE+ or Dm+ or (<noun-sub-x> & <noun-main-x>);
least: EA+; % fix! least: El+; adj: (El- & FE-)
none: <noun-sub-x> & (<noun-main-x>);
rest.i: (DG-) & <noun-sub-p> & <noun-main-p>;
plenty: {@M+} & <noun-main-x>;
other: L- or Dmu+ or ({ND-} & Dmc+) or 
(DD- & <noun-main-s>);
one_other every_other: <noun-main-s> or Ds+; 
any_other no_other: <noun-main-s> or D+;
all_other: Dm+;
most_other: Ds+;
every.d: {EN-} & (Ds+ or DTn+); % every two dogs died

another: Ds+ or NIc+ or (<noun-sub-s> & <noun-main-s>);
each: Ds+ or (<noun-sub-s> &
<noun-main-s>) or DTn+
or E+ or MVa-;
no: ({EN-} & D+) or EC+;
a_little: Dmu+ or (<noun-sub-s> & <noun-main-s>)
or EA+ or EC+ or EE+ or MVa-;
a_great_deal: EC+ or MVa- or (<noun-sub-s> & <noun-main-s>);
many_more a_few_more a_couple_more plenty_more a_lot_more:
Dmcc+ or (<noun-sub-p> & <noun-main-p>);
some_more: MVa- or Dm+ or (<noun-sub-x> & <noun-main-x>);
one_more:
Ds+ or (<noun-sub-s> & <noun-main-s>);

not_many: Dmc+ or (<noun-sub-p> & (Sp+ & <CLAUSE>));
not_all: Dm+ or (((ALx+ & Jp+) or <noun-sub-x>)
& (S+ & <CLAUSE>));
not_every no_such: Ds+;
not_one: Ds+ or (<noun-sub-s> & (Ss+ & <CLAUSE>));

% NUMERICAL EXPRESSIONS

two three four five six seven eight nine ten eleven twelve thirteen
fourteen fifteen sixteen seventeen eighteen nineteen twenty thirty forty
fifty sixty seventy eighty ninety
several: 
NN+ or NW+ or ({EN- or NIc-} & ND+) or NIa- or
({EN- or NIc-} & {{@L+} & DD-} & 
(Dmc+ or (<noun-sub-p> & <noun-main-p>)));

NUMBERS: % the generic "number" category
NN+ or NIa- or [[NF+]] or ({EN- or NIc-} & (ND+ or OD- or ({{@L+} & DD-} & 
(Dmc+ or (<noun-sub-p> & <noun-main-p>)))))
or [[G- & (<noun-main-s> or G+ or AN+)]];

2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 
29 30 31:
NN+ or NIa- or [[NF+]] or ({EN- or NIc-} & (ND+ or OD- or ({{@L+} & DD-} &  
(Dmc+ or (<noun-sub-p> 
 & <noun-main-p>))))) or TM- or [[G- & (<noun-main-s> or G+ or AN+)]];

1: NN+ or NIa- or [[NF+]] or ({EN- or NIc-} & (ND+ or OD- or ({{@L+} & DD-} 
& (D+ or (<noun-sub-x> & <noun-main-x>))))) or TM-
or [[G- & (<noun-main-s> or G+ or AN+)]] or NS+;

0: NN+ or NIa- or [[NF+]] or
({EN- or NIc-} & (ND+ or OD- or ({{@L+} & DD-} &  
(Dmc+ or [[Ds+]] or (<noun-sub-p> & <noun-main-p>))))) 
or [[G- & (<noun-main-s> or G+ or AN+)]] or NS+;

fiscal.i: TY+ & <noun-main-s>;
or_so: ND- & {{@L+} & DD-} & (Dmc+ or (<noun-sub-p> & <noun-main-p>));

words/words.y:  % year numbers
NN+ or NIa- or AN+ or 
((Xd- & TY- & Xc+) or TY-) 
or ({EN- or NIc-} & (ND+ or OD- or ({{@L+} & DD-} &  
(Dmc+ or ((<noun-sub-p> or TA-) & <noun-main-p>)))));

1900s 1910s 1920s 1930s 1940s 1950s 1960s 1970s 1980s 1990s
1900's 1910's 1920's 1930's 1940's 1950's 1960's 1970's 1980's 1990's
'20s '30s '40s '50s '60s '70s '80s '90s: {TA-} & DG- & <noun-main-x>;

hundred thousand million billion trillion dozen:
NN- & (NNy+ or NIa- or
({EN- or NIc-} & (ND+ or OD+ or ({{@L+} & DD-} &  
(Dmc+ or (<noun-sub-p>
 & <noun-main-p>))))));

hundreds thousands millions billions trillions dozens:
{DD-} & <noun-sub-p> & <noun-main-p>;
tens: {DD-} & OF+ & <noun-main-p>;
hundreds_of thousands_of millions_of billions_of trillions_of dozens_of: ND+;

1/2 3/4 2/3 1/3 1/4 1/8 3/8 5/8 7/8: 
(NNx- & NNy+) or NIa- or NF+ or NS+ 
or ({NNx-} & {EN- or NIc-} & (ND+ or OD- or ({DD-} & 
([[Ds+]] or Dmc+ or (<noun-sub-x> & <noun-main-x>)))));
% or [[G- & (<noun-main-s> or G+ or AN+)]];

second.a third fourth fifth sixth seventh eighth ninth tenth eleventh
twelfth thirteenth fourteenth fifteenth sixteenth seventeenth eighteenth
nineteenth:
L- or Pa- or MVa- or ({Xc+ & {Xd-}} & CO+) or 
(NS- & {EN-} & NF+) or (((NS- & <noun-sub-x> & {EN-}) or 
(DD- & <noun-sub-x> & {TOn+})) & <noun-main-x>) or NR+;
quarter.i:
NS- & {EN-} & (NF+ or (<noun-sub-x> & <noun-main-x>));
thirds.m fourths.m quarters.m fifths.m sixths.m sevenths.m eighths.m 
ninths.m tenths.m:
NW- & {EN-} & (NF+ or (<noun-sub-x> & <noun-main-x>));

first.a: 
L- or Pa- or E+ or MVa- or ({Xc+ & {Xd-}} & CO+) or
(DD- & <noun-sub-x> & {TOn+} & <noun-main-x>);
last.a: L- or Pa- or MVa- or ({Xc+ & {Xd-}} & CO+) or 
DTi+ or (DD- & <noun-sub-x> & {TOn+} & <noun-main-x>);

%VERBS

% These are the verb-form expressions for ordinary verbs.

<verb-pl,i>: {@E-} & (Sp- or (RS- & Bp-) or I- or Wi-);
% {@CO-} & Wi- & {CC+}
<verb-pl>: {@E-} & (Sp- or (RS- & Bp-));
<verb-s>: {@E-} & (Ss- or (RS- & Bs-));
<verb-i>: {@E-} & I-;
<verb-sp,pp>: {@E-} & (S- or (RS- & B-) or PP-);
<verb-sp>: {@E-} & (S- or (RS- & B-));
<verb-pp>: {@E-} & PP-;
<verb-pg>: {@E-} & (Pg- or Mg-);
<verb-pv>: {@E-} & (Pv- or Mv-) & {@MV+};
<verb-pv-b>: {@E-} & (Pv- or Mv-);
<verb-ge>: {@E-} & ((Xd- & Xc+ & (MX*p- or MVx-)) or 
({[DP-]} & ((Ss*g+ & <CLAUSE>) or SIs*g-)) 
or [DP- & J-] or [[Wq- & PF+]] or ({Xd-} & Xc+ & COp+));

<verb-ge-d>: ({@AN-} & {@A- & {[[@AN-]]}} & (Dmu- or [[()]]) & 
(OF+ or [[()]]) 
& <noun-sub-s> & {@MXs+} & ((Ss+ & <CLAUSE>) or SIs- or Os- or J-)) 
or [[AN+]];

<verb-pg,ge>: {@E-} & (({[DP-]} & ((Ss*g+ & <CLAUSE>) or SIs*g-)) or 
Mg- or Pg- or (Xd- & Xc+ & (MX*p- or MVx-)) 
or [DP- & J-] or [[Wq- & PF+ & {@MV+}]] or ({Xd-} & Xc+ & COp+));

<verb-po>: {@E-} & {@MV+} & ((Xd- & Xc+ & (MX*p- or MVx-))
 or [[Wq- & PF+ & {@MV+} & {CC+}]] or ({Xd-} & Xc+ & COp+)); 

% These are the verb-form expressions for special verbs that can take
% non-referential "it" as a subject.

<verb-s-pl,i>: {@E-} & (Sp- or If- or (RS- & Bp-) or Wi-); 
<verb-s-s>: {@E-} & (Ss- or SFsi- or (RS- & Bs-));
<verb-s-sp,pp>: {@E-} & (S- or SFsi- or PPf- or (RS- & B-));
<verb-s-sp>:  {@E-} & (S- or SFsi- or (RS- & B-));
<verb-s-pp>: {@E-} & PPf-;
<verb-s-pg>: {@E-} & (Pgf- or Mg-);
<verb-s-pv>: {@E-} & (Pvf- or Mv-) & {@MV+};
<verb-s-pv-b>: {@E-} & (Pvf- or Mv-);

% These are the verb-form expressions for special verbs that can take 
% either non-referential "it" or "there" as a subject.

<verb-x-pl,i>: {@E-} & (Sp- or SFp- or  If- or (RS- & Bp-) or Wi-);
<verb-x-s>: {@E-} & (Ss- or SFs- or (RS- & Bs-));
<verb-x-sp,pp>: {@E-} & (S- or SF- or (RS- & B-) or PPf-);
<verb-x-pp>: {@E-} & PPf-;
<verb-x-pg>: {@E-} & (Pgf- or Mg-);
<verb-x-pg,ge>: {@E-} & (Pgf- or Mg- or ({[DP-]} & ((Ss*g+ & <CLAUSE>) 
or SIs*g-))
or [DP- & J-] or [[Wq- & PF+ & {@MV+}]] or ({Xd-} & Xc+ & COp+));
<verb-x-sp>: {@E-} & (S- or SF- or (RS- & B-));

% AUXILIARY VERBS

<vc-do>: (((B- or O+ or [[@MV+ & O*n+]] or CX- or [[()]]) & {@MV+}) or I*d+
or Vd+);
do.v: ({N+} & {@E-} & (Sp- or SFp- or (RS- & Bp-) or Wi-) & <vc-do>)
or ((SIp+ or SFIp+) & (({Q-} & I*d+) or CQ-)) or 
({@E-} & I- & ((B- or O+ or [[@MV+ & O*n+]] or CX-) & {@MV+}));
does: ({N+} & <verb-x-s> & <vc-do>) or 
((SIs+ or SFIs+) & (({Q-} & I*d+) or CQ-));
did: ((SI+ or SFI+) & (({Q-} & I*d+) or CQ-)) or 
({N+} & <verb-x-sp> & <vc-do>);
done: (<verb-pp> & (B- or O+ or [[@MV+ & O*n+]])) or <verb-pv> or <verb-po>;
doing.v: <verb-pg> & (O+ or B- or [[@MV+ & O*n+]]) & {@MV+};
doing.g: ((O+ or B- or [[@MV+ & O*n+]]) & {@MV+} & <verb-ge>) or <verb-ge-d>;

don't: ({Q-} & (SIp+ or SFIp+) & I*d+) or ({@E-} & (Sp- or SFp- or
(RS- & Bp-) or Wi-) & ((CX- & {@MV+}) or I*d+));
doesn't: ({Q-} & (SIs+ or SFIs+) & I*d+) or (<verb-x-s> & 
(I*d+ or (CX- & {@MV+})));
didn't: ({Q-} & (SI+ or SFI+) & I*d+) or ({@E-} & (S- or SF- or
(RS- & B-)) & ((CX- & {@MV+}) or I*d+));

<vc-have>: ({@MV+} & TO+) or ((B- or O+) & {@MV+} & {[I*j+ or Pv+]})
or (([[@MV+ & O*n+]] or CX- or [[()]]) & {@MV+}) or ({N+} & PP+);
have: ((SIp+ or SFIp+) & (({Q-} & PP+) or CQ-)) or (<verb-x-pl,i> &
 <vc-have>);
has: ((SIs+ or SFIs+) & (({Q-} & PP+) or CQ-)) or (<verb-x-s> & <vc-have>);
had: ((SI+ or SFI+) & (({Q-} & PP+) or CQ-)) or (<verb-x-sp> & <vc-have>)
or (<verb-x-pp> & (TO+ or ((B- or O+) & {@MV+} & {[I*j+ or Pv+]}) or 
(([[@MV+ & O*n+]] or CX-) & {@MV+}))) or 
[[(SI*j+ or SFI**j+) & PP+ & 
((Xd- & CCq- & Xc+) or CCq- or ({{Xd-} & Xc+} & COp+))]];
having.v: <verb-pg> & <vc-have>;
having.g: (<vc-have> & <verb-ge>) or <verb-ge-d>;

hasn't: (({Q-} & (SIs+ or SFIs+)) or (<verb-x-s>)) &
(PP+ or ((CX- or [[O+]]) & {@MV+}) or [[()]]);
haven't: (({Q-} & (SIp+ or SFIp+)) or ({@E-} & (Sp- or SFp- or 
(RS- & Bp-)))) & (PP+ or ((CX- or [[O+]]) & {@MV+}) or [[()]]);
hadn't: (({Q-} & (SI+ or SFI+)) or ({@E-} & 
(S- or SFs- or SFp- or (RS- & B-)))) &
(PP+ or ((CX- or [[O+]]) & {@MV+}) or [[()]]);

<vc-be>: ({@EBm+} & (((O*t+ or [B**t-] or K+ or BI+ or OF+ or THb+
or TO+ or (Osi+ & R+ & Bs+) or (Opi+ & R+ & Bp+) or [[()]]) & {@MV+})
or (Pp+ & {THi+ or @MV+}) or Pa+)) or ({N+} & (AF- or PF- or Pg+ or Pv+));
is: ((<verb-x-s>) or 
({Q-} & (SIs+ or SFIs+))) & <vc-be>;
's.v: [[<verb-x-s> & 
(({@EBm+} & (((O*t+ or K+ or BI+ or OF+ or THb+
or (Osi+ & R+ & Bs+) or (Opi+ & R+ & Bp+)) & {@MV+})
or (Pp+ & {THi+ or @MV+}) or Pa+)) or Pg+ or Pv+ or PP+)]];
was: (({@E-} & (S*i- or SFs- or (RS- & Bs-))) or ({Q-} &
(SFIs+ or SI*i+))) & <vc-be>;
are: (({@E-} & (Spx- or SFp- or (RS- & Bp-))) or ({Q-} & 
(SIpx+ or SFIp+))) & <vc-be>;
were: ((({@E-} & (Spx- or SFp- or [[Ss-]] or [[Spi-]] or 
(RS- & Bp-))) or ({Q-} & 
(SIpx+ or SFIp+))) & <vc-be>) or [[(SI*j+ or SFI**j+) & <vc-be> &
((Xd- & CCq- & Xc+) or CCq- or ({{Xd-} & Xc+} & COp+))]];
am: (({@E-} & Spi-)
 or ({Q-} & SIpi+)) & <vc-be>;
be: {@E-} & (Ix- or Wi-) & <vc-be>;
been: {@E-} & PPf- & <vc-be>;
being.v: ((({@EBm+} & (((O*t+ or [B**t-] or Pp+ or K+ or OF+ or BI+
or TO+ or THb+) & {@MV+}) or Pa+)) or AF- or Pv+) & <verb-pg,ge>) or 
<verb-ge-d>;

isn't: (<verb-x-s> or 
({Q-} & (SIs+ or SFIs+))) & <vc-be>;
% For "..., isn't he?", add (Xd- & CC-).
wasn't: (({@E-} & (S*i- or SFs- or (RS- & Bs-))) or ({Q-} &
(SI*i+ or SFIs+))) & <vc-be>;
aren't weren't: (({@E-} & (Spx- or SFp- or (RS- & Bp-))) or 
({Q-} & (SIpx+ or SFIp+))) & <vc-be>;

will.v can.v may must could might shall: 
((SI+ or SFI+) & (({Q-} & I+) or CQ-)) or
({N+} & {@E-} & (S- or SF- or (RS- & B-)) & (I+ or (CX- & {@MV+})
or [[()]]));
should: ((SI+ or SFI+) & (({Q-} & I+) or CQ-)) or
({N+} & {@E-} & (S- or SF- or (RS- & B-)) & (I+ or (CX- & {@MV+})
or [[()]])) or [[(SI*j+ or SFI**j+) & I+ & 
((Xd- & CCq- & Xc+) or CCq- or ({{Xd-} & Xc+} & COp+))]];
would: ((SI+ or SFI+) & (({Q-} & {Vw+} & I+) or CQ-)) or
({N+} & {@E-} & (S- or SF- or (RS- & B-)) & (({RT+} & I+) or (CX- & {@MV+}) 
or [[()]]));
ought: (({Q-} & (SI+ or SFI+)) or
({@E-} & (S- or SF- or (RS- & B-)))) & (TO+ or (N+ & I+));
won't can't mustn't couldn't shouldn't cannot needn't: 
(({Q-} & (SI+ or SFI+) & I+) or
({@E-} & (S- or SF- or (RS- & B-)) & (I+ or (CX- & {@MV+}) or [[()]])));
wouldn't: (({Q-} & (SI+ or SFI+) & {RT+} & I+) or
({@E-} & (S- or SF- or (RS- & B-)) & (({RT+} & I+) or (CX- & {@MV+})
or [[()]])));

% COMMON VERB CATEGORIES

<vc-intrans>: {@MV+};
words/words.v.1.1:  % arrive
<verb-pl,i> & <vc-intrans>;
words/words.v.1.2:  % arrives
<verb-s> & <vc-intrans>;
words/words.v.1.3:  % arrived
<verb-sp,pp> & <vc-intrans>;
words/words.v.1.4:  % arriving
(<vc-intrans> & <verb-pg,ge>) or ({@E-} & A+) or <verb-ge-d>;
arisen: {@E-} & PP- & {@MV+};

<vc-walk>: {K+} & {@MV+}; 
	% intransitive verbs that can take particles like "up" and "out"
words/words.v.5.1: 
<verb-pl,i> & <vc-walk>;
words/words.v.5.2:
<verb-s> & <vc-walk>;
words/words.v.5.3:
<verb-sp,pp> & <vc-walk>;
come: (<verb-pl,i> or <verb-pp>) & <vc-walk>;
spoke.v swam lay.x came: <verb-sp> & <vc-walk>; 
spoken swum lain gone: <verb-pp> & <vc-walk>;
words/words.v.5.4: (<vc-walk> & <verb-pg,ge>) or ({@E-} & A+)
or <verb-ge-d>;
going.v: ({TOf+ or ({K+} & {@MV+})} & <verb-x-pg,ge>) or ({@E-} & A+) or
<verb-ge-d>;

<vc-tr,intr>: {O+ or B- or [[@MV+ & O*n+]]} & {@MV+};
words/words.v.2.1:
<verb-pl,i> & <vc-tr,intr>;
words/words.v.2.2:  
<verb-s> & <vc-tr,intr>;
words/words.v.2.3:  
(<verb-sp,pp> & <vc-tr,intr>) or <verb-pv> or ({@E-} & A+) or <verb-po>;
shrank sang withdrew sank forgave:
<verb-sp> & <vc-tr,intr>;
shrunk sung withdrawn sunk forgiven:
(<verb-pp> & <vc-tr,intr>) or <verb-pv> or ({@E-} & A+);
bid.v thrust.v:
((<verb-pl,i> or <verb-sp,pp>) & <vc-tr,intr>) or <verb-pv>;
words/words.v.2.4:  
<verb-pg> & <vc-tr,intr>;
words/words.v.2.5:  
(<vc-tr,intr> & <verb-ge>) or ({@E-} & A+) or <verb-ge-d>;

<vc-rise>: {K+ or OD+} & {@MV+};
rise.v fall.v: <verb-pl,i> & <vc-rise>;
rises.v falls.v: <verb-s> & <vc-rise>;
rose.v fell: <verb-sp> & <vc-rise>;
risen: <verb-pp> & <vc-rise>;
fallen: (<verb-pp> & <vc-rise>) or ({@E-} & A+);
rising falling: (<vc-rise> & <verb-pg,ge>) or ({@E-} & A+)
or <verb-ge-d>;

<vc-fill>: ((K+ & {[[@MV+]]} & O*n+) or ({O+ or B-} & {K+}) or
[[@MV+ & O*n+]]) & {@MV+};
	% optionally trans. verbs that can take particles like "up" and "out"
words/words.v.6.1: <verb-pl,i> & <vc-fill>; % fill open move
words/words.v.6.2: <verb-s> & <vc-fill>;
words/words.v.6.3:
(<verb-sp,pp> & <vc-fill>) or (<verb-pv-b> & {K+} & {@MV+}) or ({@E-} & A+)
or ({K+} & <verb-po>);
split.v spread.v beat.v fit.v: ((<verb-pl,i> or <verb-sp,pp>) & 
<vc-fill>) or (<verb-pv> & {K+}) or ({@E-} & A+) or ({K+} & <verb-po>);
ate broke flew drove woke ran rode rang hid froze drew sprang: 
<verb-sp> & <vc-fill>;
eaten broken flown driven woken beaten ridden rung hidden stricken
frozen drawn sprung: (<verb-pp> & <vc-fill>) or 
(<verb-pv> & {K+}) or ({@E-} & A+) or ({K+} & <verb-po>);
run.v cast.v: ((<verb-pl,i> or <verb-pp>) & <vc-fill>) or 
(<verb-pv> & {K+}) or ({@E-} & A+) or ({K+} & <verb-po>);
words/words.v.6.4:
<verb-pg> & <vc-fill>;
words/words.v.6.5:
(<vc-fill> & <verb-ge>) or <verb-ge-d> or ({@E-} & A+);


<vc-trans>: (O+ or B- or [[@MV+ & O*n+]]) & {@MV+};
words/words.v.4.1:  
<verb-pl,i> & <vc-trans>;
words/words.v.4.2:  
<verb-s> & <vc-trans>;
words/words.v.4.3:  
(<verb-sp,pp> & <vc-trans>) or <verb-pv> or ({@E-} & A+) or <verb-po>;
forsook overrode overtook rewrote undid overran mistook: 
<verb-sp> & <vc-trans>;
hit.v hurt shut misread shed.v rid overcome offset.v overrun.v upset.v: 
((<verb-pl,i> or <verb-sp,pp>) & <vc-trans>) or <verb-pv> or ({@E-} & A+)
or <verb-po>;
forsaken overridden overtaken rewritten undone beset mistaken.v: 
(<verb-pp> & <vc-trans>) or <verb-pv> or ({@E-} & A+) or <verb-po>;
words/words.v.4.4:  
<verb-pg> & <vc-trans>;
words/words.v.4.5: 
(<vc-trans> & <verb-ge>) or <verb-ge-d>;

<vc-kick>: ((K+ & {[[@MV+]]} & O*n+) or ((O+ or B-) & {K+}) or 
[[@MV+ & O*n+]]) & {@MV+};
	% transitive verbs that can take particles like "up" and "out"
words/words.v.8.1: % chase lift pick
<verb-pl,i> & <vc-kick>;
words/words.v.8.2:
<verb-s> & <vc-kick>;
bit.v threw stole.v drank shook wore blew tore: 
<verb-sp> & <vc-kick>;
bitten thrown stolen shaken worn blown torn:
(<verb-pp> & <vc-kick>) or (<verb-pv-b> & {K+} & {@MV+}) or ({@E-} & A+)
or ({K+} & <verb-po>);
words/words.v.8.3:
(<verb-sp,pp> & <vc-kick>) or (<verb-pv-b> & {K+} & {@MV+}) or ({@E-} & A+)
or ({K+} & <verb-po>);
cut.v: ((<verb-pl,i> or <verb-sp,pp>) & <vc-kick>) or
(<verb-pv-b> & {K+} & {@MV+}) or ({@E-} & A+) or ({K+} & <verb-po>);
words/words.v.8.4: <verb-pg> & <vc-kick>;
words/words.v.8.5:
(<vc-kick> & <verb-ge>) or <verb-ge-d>;

% INTRANSITIVE COMPLEX VERBS (those that do not take O+)

<vc-consent>: {@MV+} & {TO+};
consent.v hesitate proceed.v aspire purport: <verb-pl,i> & 
<vc-consent>;
consents hesitates proceeds.v aspires purports: <verb-s> & 
<vc-consent>;
consented hesitated proceeded.v aspired purported: <verb-sp,pp> &
<vc-consent>;
consenting hesitating proceeding.v aspiring.v purporting:
(<vc-consent> & <verb-pg,ge>) or <verb-ge-d>;

<vc-deign>: {@MV+} & TO+;
endeavour.v condescend deign: <verb-pl,i> & <vc-deign>;
endeavours.v condescends deigns: <verb-s> & <vc-deign>;
endeavoured condescended deigned: <verb-sp,pp> & <vc-deign>;
endeavouring condescending.v deigning: (<vc-deign> & <verb-pg,ge>) or 
<verb-ge-d>;

<vc-happen>: {@MV+} & {TO+ or THi+};
happen: <verb-pl,i> & <vc-happen>;
happens: <verb-s> & <vc-happen>;
happened: <verb-sp,pp> & <vc-happen>;
happening.v: (<vc-happen> & <verb-pg,ge>) or <verb-ge-d>;

<vc-wish>: {@MV+} & {TH+ or Ce+ or RSe+ or TO+};
wish.v hope.v agree.v pretend swear pray vow.v: <verb-pl,i> & <vc-wish>;
wishes.v hopes.v agrees.v pretends swears prays vows.v: <verb-s> & <vc-wish>;
wished pretended prayed vowed: <verb-sp,pp> & <vc-wish>;
hoped.v agreed.v: (<verb-sp,pp> & <vc-wish>) or (<verb-s-pv> & THi+);
swore: <verb-sp> & <vc-wish>;
sworn: <verb-pp> & <vc-wish>;
wishing hoping.v agreeing.v pretending swearing praying vowing: (<vc-wish> & 
<verb-pg,ge>) or <verb-ge-d>;

<vc-appear>: {@MV+} & {Pa+ or TOf+ or THi+ or AF- or [[Pv+]]};
appear.v: <verb-x-pl,i> & <vc-appear>;
appears.v: <verb-x-s> & <vc-appear>;
appeared.v: <verb-x-sp,pp> & <vc-appear>;
appearing.v: (<vc-appear> & <verb-x-pg,ge>) or <verb-ge-d>;

<vc-seem>: {@MV+} & (Pa+ or TOf+ or LI+ or THi+ or AF- or [[Pv+]]);
seem.v: <verb-x-pl,i> & <vc-seem>;
seems.v: <verb-x-s> & <vc-seem>;
seemed.v: <verb-x-sp,pp> & <vc-seem>;
seeming.v: (<vc-seem> & <verb-x-pg,ge>) or <verb-ge-d>;

<vc-care>: {@MV+} & {TO+ or QI+};
care.v: <verb-pl,i> & <vc-care>;
cares.v: <verb-s> & <vc-care>;
cared: <verb-sp,pp> & <vc-care>;
caring: (<vc-care> & <verb-pg,ge>) or <verb-ge-d>;

<vc-assert>: ({@MV+} & (TH+ or RSe+ or Zs-)) or Ce+;
assert.v contend.v remark.v retort.v intimate.v exclaim.v 
conjecture.v allege.v surmise.v opine.v insinuate.v: 
<verb-pl,i> & <vc-assert>; 
asserts.v contends.v remarks.v retorts.v intimates.v exclaims.v
conjectures.v alleges.v surmises.v opines.v insinuates.v: 
<verb-s> & <vc-assert>;
retorted.v intimated.v exclaimed.v conjectured.v
surmised.v opined.v insinuated.v: <verb-sp,pp> & <vc-assert>;
asserted.v contended.v remarked.v: (<verb-sp,pp> & <vc-assert>) or
(<verb-pv> & THi+);
alleged.v: (<verb-sp,pp> & <vc-assert>) or (<verb-pv> & THi+) 
or ({@E-} & A+);
asserting.v contending.v remarking.v retorting.v intimating.v
exclaiming.v conjecturing.v alleging.v surmising.v opining.v insinuating.v: 
(<vc-assert> & <verb-pg,ge>) or <verb-ge-d>;

%shout/whisper, transitive? 

<vc-muse>: {@MV+} & {TH+};
theorize.v attest fantasize muse.v speculate.v concur.v:
 <verb-pl,i> & <vc-muse>;
theorizes.v attests fantasizes muses.v speculates.v concurs.v:
 <verb-s> & <vc-muse>;
attested.v fantasized mused.v speculated.v concurred.v: 
<verb-sp,pp> & <vc-muse>;
theorized.v:  (<verb-sp,pp> & <vc-muse>) or (<verb-pv> & THi+);
theorizing.v attesting fantasizing musing.v speculating.v concurring.v: 
(<vc-muse> & <verb-pg,ge>) or <verb-ge-d>;

<vc-reply>: ({@MV+} & {TH+}) or Ce+;
reply.v shout.v whisper.v complain.v argue.v sigh.v mutter.v 
testify.v comment.v respond.v hint.v reason.v brag.v:
<verb-pl,i> & <vc-reply>;
replies.v shouts.v whispers.v complains.v argues.v sighs.v 
mutters.v testifies.v comments.v responds.v hints.v reasons.v 
brags.v:
<verb-s> & <vc-reply>;
replied.v shouted.v whispered.v complained.v argued.v sighed.v 
muttered.v testified.v commented.v responded.v hinted.v reasoned.v 
bragged.v:
<verb-sp,pp> & <vc-reply>;
replying.v shouting.v whispering.v complaining.v arguing.v sighing.v
muttering.v testifying.v commenting.v responding.v hinting.v 
reasoning.v bragging.v:
(<vc-reply> & <verb-pg,ge>) or <verb-ge-d>;

<vc-suppose>: {@MV+} & (Ce+ or TH+ or RSe+ or Z-);
suppose: <verb-pl,i> & <vc-suppose>;
supposes: <verb-s> & <vc-suppose>;
supposed: (<verb-sp,pp> & <vc-suppose>) or (<verb-s-pv> & 
{TOf+ or THi+ or Z-}) or ({@E-} & A+);
supposing: (<vc-suppose> & <verb-pg,ge>) or <verb-ge-d>;

<vc-dream>: {@MV+} & (Ce+ or TH+ or RSe+ or (OF+ & {@MV+}) or BW-);
dream.v: <verb-pl,i> & <vc-dream>;
dreams.v: <verb-s> & <vc-dream>;
dreamt dreamed: <verb-sp,pp> & <vc-dream>;
dreaming.g: (<vc-dream> & <verb-ge>) or <verb-ge-d>;
dreaming.v: <verb-pg> & <vc-dream>;

<vc-think>: {@MV+} & {Ce+ or TH+ or RSe+ or Z- or (OF+ & {@MV+}) or BW-};
think.v: <verb-pl,i> & <vc-think>;
thinks.v: <verb-s> & <vc-think>;
thought.v: (<verb-sp,pp> & <vc-think>) or (<verb-s-pv> & {THi+ or Z-});
thinking.g: (<vc-think> & <verb-ge>) or <verb-ge-d>;
thinking.v: <verb-pg> & <vc-think>;

<vc-matter>: {@MV+} & {THi+ or QIi+};
matter.v: <verb-s-pl,i> & <vc-matter>;
matters.v: <verb-s-s> & <vc-matter>;
mattered: <verb-sp,pp> & <vc-matter>;
mattering: (<vc-matter> & <verb-pg,ge>) or <verb-ge-d>;

<vc-suffice>: {@MV+} & {THi+};
suffice: <verb-pl,i> & <vc-suffice>;
suffices: <verb-s> & <vc-suffice>;
sufficed: <verb-sp,pp> & <vc-suffice>;
sufficing: (<vc-suffice> & <verb-pg,ge>) or <verb-ge-d>;

<vc-insist>: ({@MV+} & {TH+ or Zs- or TS+}) or Ce+ or (SI*j+ & I*j+);
insist.v: <verb-pl,i> & <vc-insist>;
insists.v: <verb-s> & <vc-insist>;
insisted.v: <verb-sp,pp> & <vc-insist>;
insisting.v: (<vc-insist> & <verb-pg,ge>) or <verb-ge-d>;

<vc-wonder>: {@MV+} & {QI+};
wonder.v inquire.v: <verb-pl,i> & <vc-wonder>;
wonders.v inquires.v: <verb-s> & <vc-wonder>;
wondered.v inquired.v: <verb-sp,pp> & <vc-wonder>;
wondering.v inquiring.v: (<vc-wonder> & <verb-pg,ge>) or <verb-ge-d>;

<vc-stay>: {({@MV+} & (Pa+ or AF-)) or ({K+} & {@MV+})};
stay.v: <verb-pl,i> & <vc-stay>;
stays.v: <verb-s> & <vc-stay>;
stayed: <verb-sp,pp> & <vc-stay>;
staying: (<vc-stay> & <verb-pg,ge>) or <verb-ge-d>;

<vc-act>: {@MV+} & {LI+ or Pa+ or AF-};
act.v sound.v: <verb-pl,i> & <vc-act>;
acts.v sounds.v: <verb-s> & <vc-act>;
acted sounded: <verb-sp,pp> & <vc-act>;
acting sounding: (<vc-act> & <verb-pg,ge>) or <verb-ge-d>;

<vc-look>: {({@MV+} & (LI+ or Pa+)) or ({K+ or AF-} & {@MV+})};
look.v: <verb-pl,i> & <vc-look>;
looks.v: <verb-s> & <vc-look>;
looked: <verb-sp,pp> & <vc-look>;
looking: (<vc-look> & <verb-pg,ge>) or <verb-ge-d>;

<vc-repent>: {OF+} & {@MV+};
repent disapprove talk.v: <verb-pl,i> & <vc-repent>;
repents disapproves talks.v: <verb-s> & <vc-repent>;
repented disapproved talked.v: <verb-sp,pp> & <vc-repent>;
repenting disapproving talking.v: 
(<vc-repent> & <verb-pg,ge>) or <verb-ge-d>;

<vc-consist>: OF+ & {@MV+};
consist: <verb-pl,i> & <vc-consist>;
consists: <verb-s> & <vc-consist>;
consisted: <verb-sp,pp> & <vc-consist>; 
consisting: (<vc-consist> & <verb-pg,ge>) or <verb-ge-d>;

<vc-last>: {({[[@MV+]]} & OT+) or BT-} & {@MV+};
last.v wait.v: <verb-pl,i> & <vc-last>;
lasts waits.v: <verb-s> & <vc-last>;
lasted waited.v: <verb-sp,pp> & <vc-last>;
lasting.v waiting.v: <verb-pg> & <vc-last>;
lasting.g waiting.g: (<vc-last> & <verb-ge>) or <verb-ge-d>;

% TRANSITIVE COMPLEX VERBS (Those that take O+)

<vc-attempt>: ({@MV+} & TO+) or ((O+ or B- or [[@MV+ & O*n+]]) & {@MV+});
attempt.v undertake deserve manage plot.v prefer neglect.v
afford.v commit.v profess:
<verb-pl,i> & <vc-attempt>;
attempts.v undertakes deserves manages plots.v prefers
neglects affords.v commits.v professes:
<verb-s> & <vc-attempt>;
attempted deserved managed plotted preferred neglected afforded.v committed.v
professed:
(<verb-sp,pp> & <vc-attempt>) or <verb-pv> or ({@E-} & A+)
or <verb-po>;
undertook: <verb-sp> & <vc-attempt>;
undertaken: (<verb-pp> & <vc-attempt>) or <verb-pv>;
attempting.g undertaking.g deserving.g  
plotting.g preferring.g neglecting.g affording.g committing.g professing.g:
(<vc-attempt> & <verb-ge>) or <verb-ge-d>;
managing.g: (<vc-attempt> & <verb-ge>) or <verb-ge-d> or ({@E-} & A+);
attempting.v undertaking.v deserving.v managing.v
plotting.v preferring.v neglecting.v affording.v committing.v professing.v:
<verb-pg> & <vc-attempt>; % volunteer, aim, manage? - opt no comp

<vc-seek>: ({@MV+} & TO+) or 
((((O+ or B-) & {K+}) or (K+ & {[[@MV+]]} & O*n+) or 
([[@MV+ & O*n+]])) & {@MV+});
seek: <verb-pl,i> & <vc-seek>;
seeks: <verb-s> & <vc-seek>;
sought: (<verb-sp,pp> & <vc-seek>) or <verb-pv> or <verb-po>;
seeking.g: (<vc-seek> & <verb-ge>) or <verb-ge-d>;
seeking.v: <verb-pg> & <vc-seek>;

<vc-decline>: ({@MV+} & TO+) or ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+});
decline.v fail hasten volunteer.v aim.v: <verb-pl,i> & <vc-decline>;
declines.v fails hastens volunteers.v aims.v: <verb-s> & <vc-decline>;
declined hastened volunteered aimed: (<verb-sp,pp> & <vc-decline>) or 
<verb-pv> or <verb-po>;
failed: (<verb-sp,pp> & <vc-decline>) or <verb-pv> or ({@E-} & A+);
declining.g failing.g hastening.g volunteering.g: 
(<vc-decline> & <verb-ge>) or <verb-ge-d>
or ({@E-} & A+);
declining.v failing.v hastening.v volunteering.v aiming.v: 
<verb-pg> & <vc-decline>;

<vc-fight>: ({@MV+} & TO+) or 
({({O+ or B-} & {K+}) or (K+ & {[[@MV+]]} & O*n+) or 
[[@MV+ & O*n+]]} & {@MV+});
fight.v: <verb-pl,i> & <vc-fight>;
fights.v: <verb-s> & <vc-fight>;
fought: (<verb-sp,pp> & <vc-fight>) or (<verb-pv-b> & {K+} & {@MV+}) or
({K+} & <verb-po>);
fighting.g: (<vc-fight> & <verb-ge>) or <verb-ge-d>;
fighting.v: <verb-pg> & <vc-fight>;

<vc-threaten>: 
({@MV+} & (TO+ or TH+ or Zs-)) or Ce+ or 
((O+ or B- or [[@MV+ & O*n+]]) & {@MV+});
threaten.v mean.v arrange resolve.v pledge.v
plan.v: <verb-pl,i> & <vc-threaten>;
threatens.v means.v arranges resolves.v pledges.v
plans.v: <verb-s> & <vc-threaten>;
threatened.v planned meant arranged resolved.v pledged.v:
(<verb-sp,pp> & <vc-threaten>) or <verb-pv> or ({@E-} & A+) or <verb-po>;
planning.g meaning.g arranging.g resolving.g threatening.g pledging.g: 
(<vc-threaten> & <verb-ge>) or <verb-ge-d>;
planning.v meaning.v arranging.v resolving.v threatening.v pledging.v:
<verb-pg> & <vc-threaten>;

<vc-decide>: ((O+ or B- or [[@MV+ & O*n+]]) & {@MV+}) or
({@MV+} & {QI+ or TO+ or Ce+ or TH+ or RSe+ or Zs-});
decide.v: <verb-pl,i> & <vc-decide>;
decides.v: <verb-s> & <vc-decide>;
decided.v: (<verb-sp,pp> & <vc-decide>) or (<verb-s-pv> & {THi+}) 
or <verb-po>;
deciding.v: <verb-pg> & <vc-decide>;
deciding.g: (<vc-decide> & <verb-ge>) or <verb-ge-d>;

<vc-forget>: ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or 
({@MV+} & (TH+ or TO+ or Ce+ or RSe+ or Zs- or QI+
or Pg+));
remember.v forget: <verb-pl,i> & <vc-forget>;
remembers.v forgets: <verb-s> & <vc-forget>;
remembered.v: (<verb-sp,pp> & <vc-forget>) or <verb-pv> or <verb-po>;
forgot: <verb-sp> & <vc-forget>;
forgotten: (<verb-pp> & <vc-forget>) or <verb-pv> or ({@E-} & A+)
or <verb-po>;
remembering.g forgetting.g: (<vc-forget> & <verb-ge>) or <verb-ge-d>;
remembering.v forgetting.v: <verb-pg> & <vc-forget>;

<vc-learn>: ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or 
({@MV+} & (TH+ or TO+ or Ce+ or RSe+ or Zs- or QI+ or (OF+ & {@MV+})));
learn.v: <verb-pl,i> & <vc-learn>;
learns.v: <verb-s> & <vc-learn>;
learned.v: (<verb-sp,pp> & <vc-learn>) or (<verb-pv> & {THi+}) or <verb-po>;
learning.g: (<vc-learn> & <verb-ge>) or <verb-ge-d>;
learning.v: <verb-pg> & <vc-learn>;

<vc-propose>: ((O+ or B- or [[@MV+ & O*n+]]) & {@MV+}) or
({@MV+} & (TO+ or TH+ or Ce+ or RSe+ or Z- or Pg+ or TS+ or (SI*j+ & I*j+)));
propose.v: <verb-pl,i> & <vc-propose>;
proposes.v: <verb-s> & <vc-propose>;
proposed.v: (<verb-sp,pp> & <vc-propose>) or 
(<verb-s-pv> & {THi+ or TSi+ or Z-}) or ({@E-} & A+) or <verb-po>;
proposing.g: (<vc-propose> & <verb-ge>) or <verb-ge-d>;
proposing.v: <verb-pg> & <vc-propose>;

<vc-demand>: ((O+ or B- or [[@MV+ & O*n+]]) & {@MV+}) or
({@MV+} & ((TO+ or TH+ or Z- or TS+ or ((SI*j+ or SFI**j+) & I*j+))));
demand.v: <verb-pl,i> & <vc-demand>;
demands.v: <verb-s> & <vc-demand>;
demanded: (<verb-sp,pp> & <vc-demand>) or <verb-pv> or 
<verb-po>;
demanding.v: <verb-pg> & <vc-demand>;
demanding.g: (<vc-demand> & <verb-ge>) or <verb-ge-d>;

<vc-beg>: ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or
({@MV+} & ((TO+ or TH+ or Z- or TS+ or ((SI*j+ or SFI**j+) & I*j+))));
beg plead: <verb-pl,i> & <vc-beg>;
begs pleads: <verb-s> & <vc-beg>;
begged pleaded: (<verb-sp,pp> & <vc-beg>) or <verb-pv> or 
<verb-po>;
begging.v pleading.v: <verb-pg> & <vc-beg>;
begging.g pleading.g: (<vc-beg> & <verb-ge>) or <verb-ge-d>;

<vc-bear>: (O+ or B- or [[@MV+ & O*n+]]) & {@MV+};
bear.v: (<verb-i> & (<vc-bear> or
({@MV+} & (Pg+ or TH+ or TO+)))) or (<verb-pl> & <vc-bear>);
bears.v: <verb-s> & <vc-bear>;
bore.p: <verb-sp,pp> & <vc-bear>;
born.v: (<verb-pp> & <vc-bear>) or <verb-pv> or <verb-po>;
bearing.g: (<vc-bear> & <verb-ge>) or <verb-ge-d>;
bearing.v: <verb-pg> & <vc-bear>;

<vc-love>: ((O+ or B- or [[@MV+ & O*n+]]) & {@MV+}) or 
({@MV+} & (TO+ or Pg+));
love.v dislike: <verb-pl,i> & <vc-love>;
loves dislikes: <verb-s> & <vc-love>;
loved disliked: (<verb-sp,pp> & <vc-love>) or <verb-pv> or <verb-po>;
loving.g disliking.g: (<vc-love> & <verb-ge>) or <verb-ge-d>;
loving.v disliking.v: <verb-pg> & <vc-love>;

<vc-begin>: ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or
 ({@MV+} & (TO+ or Pg+));
begin.v continue.v cease: <verb-pl,i> & <vc-begin>;
begins.v continues.v ceases: <verb-s> & <vc-begin>;
ceased: (<verb-sp,pp> & <vc-begin>) or <verb-pv> or <verb-po>;
continued.v: (<verb-sp,pp> & <vc-begin>) or <verb-pv> or <verb-po>
or ({@E-} & A+);
began.v: <verb-sp> & <vc-begin>;
begun.v: (<verb-pp> & <vc-begin>) or <verb-pv> or <verb-po>;
beginning.g ceasing.g: 
(<vc-begin> & <verb-ge>) or <verb-ge-d>;
continuing.g: (<vc-begin> & <verb-ge>) or <verb-ge-d> or ({@E-} & A+);
beginning.v continuing.v ceasing.v: <verb-pg> & <vc-begin>;

<vc-start>: ((({O+ or B-} & {K+}) or (K+ & {[[@MV+]]} & O*n+)
or [[@MV+ & O*n+]]) & {@MV+}) or ({@MV+} & (TO+ or Pg+));
start.v stop.v try: <verb-pl,i> & <vc-start>;
starts.v stops.v tries: <verb-s> & <vc-start>;
started stopped tried: (<verb-sp,pp> & <vc-start>) or (<verb-pv-b> 
& {K+} & {@MV+}) or ({K+} & <verb-po>);
starting.g stopping.g trying.g: (<vc-start> & <verb-ge>) or <verb-ge-d>;
starting.v stopping.v trying.v: <verb-pg> & <vc-start>;

<vc-dispute>: ({@MV+} & (TH+ or Zs-)) or ((O+ or B- or [[@MV+ & O*n+]]) 
& {@MV+});
recognize.v dispute.v accept calculate.v
record.v deduce.v envision.v recount.v signify clarify disclose.v 
recollect.v adduce.v posit.v reiterate.v infer.v presuppose.v: 
<verb-pl,i> & <vc-dispute>;
recognizes.v disputes.v calculates.v records.v deduces.v
accepts envisions.v recounts.v signifies clarifies discloses.v recollects.v
adduces.v posits.v reiterates.v infers.v presupposes.v: 
<verb-s> & <vc-dispute>;
recognized.v disputed.v accepted calculated.v recorded deduced.v envisioned.v
recounted.v signified clarified disclosed.v recollected.v adduced.v posited.v
reiterated.v inferred.v presupposed.v:
 (<verb-sp,pp> & <vc-dispute>) or (<verb-s-pv> & {THi+}) or ({@E-} & A+)
or <verb-po>; % check for THi
recognizing.g disputing.g accepting.g calculating.g deducing.g recording.g 
envisioning.g recounting.g signifying.g clarifying.g disclosing.g
recollecting.g adducing.g positing.g reiterating.g inferring.g presupposing.g:
(<vc-dispute> & <verb-ge>) or <verb-ge-d>;
recognizing.v disputing.v accepting.v calculating.v deducing.v recording.v
envisioning.v recounting.v signifying.v clarifying.v disclosing.v
recollecting.v adducing.v positing.v reiterating.v inferring.v presupposing.v:
<verb-pg> & <vc-dispute>;

<vc-repeat>: ({@MV+} & TH+) or ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+});
repeat.v reflect.v provide counter.v signal.v: <verb-pl,i> & <vc-repeat>;
repeats.v reflects.v provides counters.v signals.v: <verb-s> & <vc-repeat>;
repeated.v reflected.v countered.v signaled signalled: 
(<verb-sp,pp> & <vc-repeat>) or <verb-pv> or <verb-po> or ({@E-} & A+);
provided: (<verb-sp,pp> & <vc-repeat>) or <verb-pv> or <verb-po> or ({@E-} &
 A+) or
((TH+ or Ce+) & (({{Xd-} & Xc+} & CO+) or ({Xd- & Xc+} & MVs-)));
repeating.v reflecting.v providing.v countering.v signaling.v signalling.v: 
<verb-pg> & <vc-repeat>;
repeating.g reflecting.g countering.g signaling.g signalling.g: 
(<vc-repeat> & <verb-ge>) or <verb-ge-d>;
providing.g: (<vc-repeat> & <verb-ge>) or <verb-ge-d>
or ((TH+ or Ce+) & (({{Xd-} & Xc+} & CO+) or ({Xd- & Xc+} & MVs-)));

<vc-sense>: ({@MV+} & (Ce+ or TH+ or RSe+)) or ((O+ or B- or [[@MV+ & O*n+]])
 & {@MV+});
sense.v doubt.v reaffirm reckon.v regret.v proclaim.v ascertain.v discern.v 
stipulate.v affirm.v certify trust.v postulate.v ensure imply.v verify:
 <verb-pl,i> & <vc-sense>;
senses.v reaffirms doubts.v reckons.v regrets.v proclaims.v 
stipulates.v ascertains.v discerns.v affirms.v certifies trusts.v 
postulates.v ensures implies.v verifies: 
<verb-s> & <vc-sense>;
doubted reaffirmed sensed.v reckoned.v regretted stipulated.v
proclaimed.v ascertained.v discerned.v affirmed.v certified 
trusted postulated.v ensured implied.v verified:
(<verb-sp,pp> & <vc-sense>) or (<verb-s-pv> & {THi+}) or ({@E-} & A+)
or <verb-po>;
reaffirming.g sensing.g doubting.g stipulating.g
reckoning.g regretting.g proclaiming.g ascertaining.g 
discerning.g affirming.g certifying.g trusting.g 
postulating.g ensuring.g implying.g verifying.g:
 (<vc-sense> & <verb-ge>) or <verb-ge-d>;
sensing.v doubting.v reckoning.v reaffirming.v stipulating.v
regretting.v proclaiming.v ascertaining.v discerning.v 
affirming.v certifying.v trusting.v postulating.v ensuring.v 
implying.v verifying.v:
 <verb-pg> & <vc-sense>;

<vc-declare>: ({@MV+} & (Ce+ or TH+ or RSe+ or Z-)) or ((O+ or B- or
[[@MV+ & O*n+]]) & {@MV+});
declare.v imagine.v fear.v conclude.v 
confess.v suspect.v concede.v presume.v foresee.v
emphasize.v maintain.v acknowledge.v note.v confirm.v stress.v assume.v: 
<verb-pl,i> & <vc-declare>;
declares.v imagines.v fears.v concludes.v 
confesses.v suspects.v concedes.v presumes.v foresees.v
emphasizes.v maintains.v acknowledges.v notes.v
confirms.v stresses.v assumes.v: 
<verb-s> & <vc-declare>;
declared.v imagined.v feared concluded.v confessed.v
suspected.v conceded.v presumed.v
emphasized.v maintained.v acknowledged.v noted.v 
confirmed.v stressed.v assumed.v: 
(<verb-sp,pp> & <vc-declare>) or (<verb-s-pv> & {THi+}) or ({@E-} & A+)
or <verb-po>;
foresaw: <verb-sp> & <vc-declare>;
foreseen: (<verb-pp> & <vc-declare>) or (<verb-s-pv> & {@MV+ or THi+}) or 
({@E-} & A+) or <verb-po>;
declaring.g imagining.g fearing.g 
concluding.g confessing.g suspecting.g conceding.g
presuming.g foreseeing.g emphasizing.g maintaining.g acknowledging.g noting.g
confirming.g stressing.g
assuming.g: (<vc-declare> & <verb-ge>) or <verb-ge-d>;
declaring.v imagining.v fearing.v
concluding.v confessing.v suspecting.v conceding.v
presuming.v foreseeing.v
emphasizing.v maintaining.v acknowledging.v
noting.v confirming.v stressing.v 
assuming.v: <verb-pg> & <vc-declare>;

<vc-believe>: ({@MV+} & (Ce+ or TH+ or RSe+)) or ({O+ or B- or 
[[@MV+ & O*n+]]} & {@MV+});
believe.v answer.v worry.v protest.v: <verb-pl,i> & <vc-believe>;
believes.v answers.v worries.v protests.v: <verb-s> & <vc-believe>;
believed.v answered.v worried.v protested.v: 
(<verb-sp,pp> & <vc-believe>) or (<verb-s-pv> & {THi+ or TOf+}) or <verb-po>;
believing.g answering.g worrying.g protesting.g: 
(<vc-believe> & <verb-ge>) or <verb-ge-d>;
believing.v answering.v worrying.v protesting.v: <verb-pg> & <vc-believe>;

%<vc-follow>: ({@MV+} & THi+) or ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+});

<vc-rule>: ({@MV+} & (Ce+ or TH+ or RSe+)) or 
((({O+ or B-} & {K+}) or (K+ & {[[@MV+]]} & O*n+)
or [[@MV+ & O*n+]]) & {@MV+});
rule.v add.v: <verb-pl,i> & <vc-rule>;
rules.v adds.v: <verb-s> & <vc-rule>;
ruled.v added.v: 
(<verb-sp,pp> & <vc-rule>) or (<verb-s-pv-b> & {({@MV+} & (THi+ or TOf+)) or
({K+} & {@MV+})}) or ({K+} & <verb-po>);
ruling.g adding.g: (<vc-rule> & <verb-ge>) or <verb-ge-d>;
ruling.v adding.v: <verb-pg> & <vc-rule>;

<vc-figure>: ({@MV+} & (TH+ or Zs-)) or Ce+ or 
((((O+ or B-) & {K+}) or (K+ & {[[@MV+]]} & O*n+)) & {@MV+}) or 
([[@MV+ & O*n+]]);
figure.v: <verb-pl,i> & <vc-figure>;
figures.v: <verb-s> & <vc-figure>;
figured.v: (<verb-sp,pp> & <vc-figure>) or (<verb-pv-b> & {K+} & {@MV+})
or ({K+} & <verb-po>);
figuring.g: (<vc-figure> & <verb-ge>) or <verb-ge-d>;
figuring.v: <verb-pg> & <vc-figure>;

<vc-predict>: ((O+ or B- or [[@MV+ & O*n+]]) & {@MV+}) or
({@MV+} & (QI+ or Ce+ or TH+ or RSe+ or Zs-));
predict.v realize.v discover.v determine.v announce.v say.v mention.v admit.v
recall.v reveal.v state.v observe.v indicate.v: <verb-pl,i> & <vc-predict>;
predicts.v realizes.v discovers.v determines.v announces.v says.v 
mentions.v admits.v recalls.v reveals.v states.v observes.v indicates:
<verb-s> & <vc-predict>;
predicted.v realized.v discovered.v determined.v announced.v mentioned
admitted.v recalled.v revealed.v stated.v observed.v indicated:
(<verb-sp,pp> & <vc-predict>) or (<verb-s-pv> & {THi+}) or ({@E-} & A+)
or <verb-po>;
said.v: (<verb-sp,pp> & <vc-predict>) or ({@E-} & (Pvf- or [[Mv-]]) 
& {@MV+} & {THi+}) or ({@E-} & A+) or <verb-po>;
predicting.g realizing.g discovering.g determining.g
announcing.g saying.g mentioning.g admitting.g recalling.g revealing.g
stating.g observing.g indicating.g: (<vc-predict> & <verb-ge>) or <verb-ge-d>;
predicting.v realizing.v discovering.v determining.v
announcing.v saying.v mentioning.v admitting.v recalling.v revealing.v
stating.v observing.v indicating.v: <verb-pg> & <vc-predict>;

<vc-guess>: ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) 
or ({@MV+} & (TH+ or QI+ or Ce+ or RSe+ or Zs-));
guess.v estimate.v understand notice.v explain.v demonstrate: 
<verb-pl,i> & <vc-guess>;
guesses.v estimates.v understands notices.v explains.v demonstrates:
<verb-s> & <vc-guess>;
guessed.v understood noticed explained.v demonstrated: 
(<verb-sp,pp> & <vc-guess>) or (<verb-s-pv> & {THi+}) or <verb-po>;
estimated: (<verb-sp,pp> & <vc-guess>) 
or (<verb-s-pv> & {THi+}) or <verb-po> or ({@E-} & A+);
guessing.g estimating.g understanding.g noticing.g explaining.g 
demonstrating.g: (<vc-guess> & <verb-ge>) or <verb-ge-d>;
guessing.v estimating.v understanding.v noticing.v explaining.v
demonstrating.v: <verb-pg> & <vc-guess>;

<vc-know>: ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) 
or ({@MV+} & ((OF+ & {@MV+}) or QI+ or Ce+ or TH+ or RSe+ or Zs-));
know: <verb-pl,i> & <vc-know>;
knows: <verb-s> & <vc-know>;
knew: <verb-sp> & <vc-know>;
known: (<verb-pp> & <vc-know>) or (<verb-s-pv> & {THi+ or TOf+ or QIi+})
or <verb-po>;
knowing.g: (<vc-know> & <verb-ge>) or <verb-ge-d>;
knowing.v: <verb-pg> & <vc-know>;

<vc-request>: ((O+ or B- or [[@MV+ & O*n+]]) & {@MV+}) or
({@MV+} & (TH+ or Ce+ or RSe+ or Zs- or TS+ or ((SI*j+ or SFI**j+) & I*j+)));
request.v: <verb-pl,i> & <vc-request>;
requests.v: <verb-s> & <vc-request>;
requested: (<verb-sp,pp> & <vc-request>) or (<verb-s-pv> & {THi+ or TSi+})
 or ({@E-} & A+) or <verb-po>;
requesting.g: (<vc-request> & <verb-ge>) or <verb-ge-d>;
requesting.v: <verb-pg> & <vc-request>;

<vc-feel>: 
((O+ or B- or [[@MV+ & O*n+]]) & {@MV+}) or ({@MV+} & (Pa+ or TH+ or Ce+
 or RSe+ or AF- or ((LI+ or LJ+) or {@MV+})));
feel: <verb-pl,i> & <vc-feel>;
feels: <verb-s> & <vc-feel>;
felt.v: (<verb-sp,pp> & <vc-feel>) or (<verb-s-pv> & {THi+}) or <verb-po>;
feeling.g: (<vc-feel> & <verb-ge>) or <verb-ge-d>;
feeling.v: <verb-pg> & <vc-feel>;

<vc-mind>: ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or 
({@MV+} & (QI+ or TH+ or Pg+));
mind.v: <verb-pl,i> & <vc-mind>;
minds.v: <verb-s> & <vc-mind>;
minded: (<verb-sp,pp> & <vc-mind>) or <verb-pv> or <verb-po>;
minding.g: (<vc-mind> & <verb-ge>) or <verb-ge-d>;
minding.v: <verb-pg> & <vc-mind>;

<vc-study>: ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or ({@MV+} & QI+);
study.v: <verb-pl,i> & <vc-study>;
studies.v: <verb-s> & <vc-study>;
studied: (<verb-sp,pp> & <vc-study>) or <verb-pv> or ({@E-} & A+)
or <verb-po>;
studying.g: (<vc-study> & <verb-ge>) or <verb-ge-d>;
studying.v: <verb-pg> & <vc-study>;

<vc-discuss>: ((O+ or B- or [[@MV+ & O*n+]]) & {@MV+}) or ({@MV+} & Pg+);
discuss oppose enjoy hate.v advocate.v contemplate entail necessitate
justify risk.v avoid involve anticipate favor.v: 
<verb-pl,i> & <vc-discuss>;
discusses opposes enjoys hates advocates.v contemplates entails necessitates
justifies risks.v avoids involves anticipates favors.v: 
<verb-s> & <vc-discuss>;
discussed opposed.v enjoyed hated advocated contemplated entailed
necessitated justified.v risked avoided involved anticipated favored.v: 
(<verb-sp,pp> & <vc-discuss>) or <verb-pv> or ({@E-} & A+) or <verb-po>;
discussing.g opposing.g enjoying.g hating.g advocating.g contemplating.g
entailing.g necessitating.g justifying.g risking.g avoiding.g
anticipating.g favoring.g involving.g: 
(<vc-discuss> & <verb-ge>) or <verb-ge-d>;
discussing.v opposing.v enjoying.v hating.v advocating.v contemplating.v
entailing.v necessitating.v justifying.v risking.v avoiding.v involving.v
anticipating.v favoring.v: 
<verb-pg> & <vc-discuss>;

<vc-finish>: ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or ({@MV+} & Pg+);
finish.v practice.v resist: <verb-pl,i> & <vc-finish>;
finishes.v practices.v resists quits: <verb-s> & <vc-finish>;
finished practiced resisted quitted: 
(<verb-sp,pp> & <vc-finish>) or <verb-pv> or ({@E-} & A+) or <verb-po>;
quit: ((<verb-sp,pp> or <verb-pl,i>) & <vc-finish>) or <verb-pv> or 
({@E-} & A+) or <verb-po>;
finishing.g practicing.g resisting.g
quitting.g: (<vc-finish> & <verb-ge>) or <verb-ge-d>;
finishing.v practicing.v resisting.v quitting.v: <verb-pg> & <vc-finish>;

<vc-turn>: ((O+ or (K+ & {[[@MV+]]} & O*n+) or ({O+ or B-} & {K+}) or
 [[@MV+ & O*n+]]) & {@MV+}) or ({@MV+} & (Pa+ or AF-));
turn.v: <verb-pl,i> & <vc-turn>;
turns.v: <verb-s> & <vc-turn>;
turned.v: (<verb-sp,pp> & <vc-turn>) or (<verb-pv-b> & {K+} & {@MV+})
or ({K+} & <verb-po>);
turning.v: <verb-pg> & <vc-turn>;
turning.g: (<vc-turn> & <verb-ge>) or <verb-ge-d>;

<vc-become>: ((O+ or B- or TI+ or [[@MV+ & (O*n+ or TI+)]] or [[Pv+]]) 
& {@MV+}) or ({@MV+} & (AF- or Pa+));
become: ((<verb-s-pl,i> or <verb-s-pp>) & <vc-become>) or <verb-pv>;
becomes: <verb-s-s> & <vc-become>;
became: <verb-s-sp> & <vc-become>;
becoming.g: (<vc-become> & <verb-ge>) or <verb-ge-d>;
becoming.v: <verb-pg> & <vc-become>;

<vc-remain>: ({@MV+} & (AF- or Pa+)) or ({O+ or B- or TI+ or
[[@MV+ & (O*n+ or TI+)]] or [[Pv+]]} & {@MV+});
remain: <verb-pl,i> & <vc-remain>;
remains.v: <verb-s> & <vc-remain>;
remained: <verb-sp,pp> & <vc-remain>;
remaining.g: (<vc-remain> & <verb-ge>) or <verb-ge-d> or ({@E-} & A+);
remaining.v: <verb-pg> & <vc-remain>;

<vc-grow>: ({@MV+} & (AF- or Pa+)) or ((({O+ or B-} & {K+}) or 
(K+ & {[[@MV+]]} & O*n+) or [[@MV+ & O*n+]]) & {@MV+});
grow: <verb-pl,i> & <vc-grow>;
grows: <verb-s> & <vc-grow>;
grew: <verb-sp> & <vc-grow>;
grown: (<verb-pp> & <vc-grow>) or (<verb-pv-b> & {K+} & {@MV+}) or
({K+} & <verb-po>);
growing.g: (<vc-grow> & <verb-pg,ge>) or ({@E-} & A+) or <verb-ge-d>;
growing.v: <verb-pg> & <vc-grow>;

<vc-approve>: {O+ or B- or [[@MV+ & O*n+]] or ({@MV+} & OF+)} & {@MV+};
approve: <verb-pl,i> & <vc-approve>;
approves: <verb-s> & <vc-approve>;
approved: (<verb-sp,pp> & <vc-approve>) or <verb-pv> or ({@E-} & A+)
or <verb-po>;
approving.g: (<vc-approve> & <verb-ge>) or <verb-ge-d>;
approving.v: <verb-pg> & <vc-approve>;

<vc-dispose>: (O+ or B- or [[@MV+ & O*n+]] or ({@MV+} & OF+)) & {@MV+};
dispose conceive: <verb-pl,i> & <vc-dispose>;
disposes conceives: <verb-s> & <vc-dispose>;
disposed conceived: (<verb-sp,pp> & <vc-dispose>) or <verb-pv> or 
({@E-} & A+) or <verb-po>;
disposing.g conceiving.g: (<vc-dispose> & <verb-ge>) or <verb-ge-d>;
disposing.v conceiving.v: <verb-ge> & <vc-dispose>;

<vc-taste>: ({@MV+} & ((LI+ & {@MV+}) or AF- or Pa+)) or 
((O+ or B- or [[@MV+ & O*n+]]) & {@MV+});
taste.v: <verb-pl,i> & <vc-taste>;
tastes.v: <verb-s> & <vc-taste>;
tasted: (<verb-sp,pp> & <vc-taste>) or <verb-pv> or <verb-po>;
tasting.g: (<vc-taste> & <verb-ge>) or <verb-ge-d>;
tasting.v: <verb-pg> & <vc-taste>;

<vc-smell>: ({@MV+} & ((LI+ & {@MV+}) or AF- or Pa+)) or 
({O+ or B- or [[@MV+ & O*n+]]} & {@MV+});
smell.v: <verb-pl,i> & <vc-smell>;
smells.v: <verb-s> & <vc-smell>;
smelled: (<verb-sp,pp> & <vc-smell>) or <verb-pv> or <verb-po>;
smelling.g: (<vc-smell> & <verb-ge>) or <verb-ge-d>;
smelling.v: <verb-pg> & <vc-smell>;

<vc-take>: 
(((K+ & {[[@MV+]]} & O*n+) or ((O+ or B-) & {K+ or Vt+}) or [[@MV+ & O*n+]]) 
& {@MV+}) or 
({O+} & (OT+ or BT-) & {@MV+} & {(TOt+ & B+) or TOi+}) or 
(OXii+ & Vt+ & {@MV+} & TH+);
take: <verb-s-pl,i> & <vc-take>;
takes: <verb-s-s> & <vc-take>;
took: <verb-s-sp> & <vc-take>;
taken: (<verb-s-pp> & <vc-take>) or (<verb-pv-b> & 
{K+} & {@MV+}) or ({@E-} & A+) or ({K+} & <verb-po>) or (Pvf- & Vt+ & THi+);
taking.v: <verb-s-pg> & <vc-take>;
taking.g: (<vc-take> & <verb-ge>) or <verb-ge-d>;
for_granted: Vt-;

% VERBS TAKING [OBJ] + [OTHER COMPLEMENT]

<vc-put>: ((K+ & {[[@MV+]]} & O*n+) or ((O+ or B-) & 
(K+ or Pp+ or WR-))) & {@MV+};
put: ((<verb-pl,i> or <verb-sp,pp>) & <vc-put>) or (<verb-pv-b> & 
(K+ or Pp+ or WR-) & {@MV+}) or ((K+ or Pp+) & <verb-po>);
puts: <verb-s> & <vc-put>;
putting.v: <verb-pg> & <vc-put>;
putting.g: (<vc-put> & <verb-ge>) or <verb-ge-d>;

<vc-cost>: (((O+ & {{[[@MV+]]} & O*n+}) or (B- & {O+})) & {@MV+} & {TOi+})
or ([[@MV+ & O*n+]]);
cost.v: (<verb-s-pl,i> or <verb-s-sp,pp>) & <vc-cost>;
costs.v: <verb-s-s> & <vc-cost>;
costing.v: <verb-s-pg> & <vc-cost>;
costing.g: (<vc-cost> & <verb-ge>) or <verb-ge-d>;
% restricted passives here - "*Five dollars were cost him", 
% "*Three hours were taken to fix it", "*He was gotten angry"

<vc-find>: ((K+ or O+) & {[[@MV+]]} & O*n+) or (B- & O+) or ((O+ or B-) & 
(({@MV+} & (Pa+ or AF- or Pg+)) or ({K+} & {@MV+}))) or ([[@MV+ & O*n+]]) or
({@MV+} & (TH+ or Ce+ or RSe+));
find.v: <verb-pl,i> & <vc-find>;
finds.v: <verb-s> & <vc-find>;
found.p: (<verb-sp,pp> & <vc-find>) or 
(<verb-pv-b> & (({K+ or AF-} & {@MV+}) or Pa+ or Pg+)) or 
({K+ or Pa+ or Pg+} & <verb-po>);
finding.v: <verb-pg> & <vc-find>;
finding.g: (<vc-find> & <verb-ge>) or <verb-ge-d>;

<vc-get>: ((O+ or B-) & (({K+} & {@MV+}) or ({@MV+} & (Pa+ or AF- or Pv+))))
or (((K+ & {[[@MV+]]} & O*n+) or K+ or (B- & O+) or (O+ & {[[@MV+]]} & O*n+))
 & {@MV+}) or ({@MV+} & (Pa+ or AF- or Pv+ or Pp+ or TO+));
get: <verb-pl,i> & <vc-get>;
gets: <verb-s> & <vc-get>;
got: <verb-sp,pp> & <vc-get>;
gotten: (<verb-pp> & <vc-get>) or (<verb-pv-b> & {K+ or Pp+} & {@MV+})
or ({K+ or Pp+} & <verb-po>);
getting.v: <verb-pg> & <vc-get>;
getting.g: (<vc-get> & <verb-ge>) or <verb-ge-d>;

<vc-leave>: ((O+ or B-) & 
(({K+} & {@MV+}) or ({@MV+} & {Pa+ or AF- or Pv+ or Pg+}))) or 
({(K+ & {[[@MV+]]} & O*n+) or ([[@MV+ & O*n+]])} & {@MV+});
leave: <verb-pl,i> & <vc-leave>;
leaves.v: <verb-s> & <vc-leave>;
left.v: (<verb-sp,pp> & <vc-leave>) or (<verb-pv-b> & 
(({K+ or AF-} & {@MV+}) or Pv+ or Pa+ or Pg+)) or 
({K+ or ({@MV+} & (Pv+ or Pa+ or Pg+))} & <verb-po>);
leaving.v: <verb-pg> & <vc-leave>;
leaving.g: (<vc-leave> & <verb-ge>) or <verb-ge-d>;

<vc-keep>: ((O+ or (K+ & {[[@MV+]]} & O*n+) or [[@MV+ & O*n+]] or Vk+) 
& {@MV+}) 
or ({O+ or B-} & ((K+ & {@MV+}) or ({@MV+} & (Pa+ or AF- or Pg+ or Pv+))));
keep: <verb-pl,i> & <vc-keep>;
keeps: <verb-s> & <vc-keep>;
kept: (<verb-sp,pp> & <vc-keep>) or 
(<verb-pv-b> & (({K+ or AF-} & {@MV+}) or Pa+ or Pg+ or Pv+)) or
({K+ or ({@MV+} & (Pa+ or Pg+ or Pv+))} & <verb-po>);
keeping.v: <verb-pg> & <vc-keep>;
keeping.g: (<vc-keep> & <verb-ge>) or <verb-ge-d>;
watch.i vigil.i: Vk-;

<vc-set>: ((K+ & {[[@MV+]]} & O*n+) or ({O+ or B-} & {K+ or Vs+}) 
or [[@MV+ & O*n+]]) & {@MV+};
set.v: ((<verb-pl,i> or <verb-sp,pp>) & 
<vc-set>) or (<verb-pv> & {K+ or Vs+}) or ({@E-} & A+) or ({K+ or Vs+} 
& <verb-po>);
sets.v: <verb-s> & <vc-set>;
setting.v:
<verb-pg> & <vc-set>;
setting.g:
(<vc-set> & <verb-ge>) or <verb-ge-d> or ({@E-} & A+);

<vc-hold>: ((K+ & {[[@MV+]]} & O*n+) or ({O+ or B-} & {K+ or Vh+}) or 
[[@MV+ & O*n+]]) & {@MV+};
hold.v: <verb-pl,i> & <vc-hold>;
holds.v: <verb-s> & <vc-hold>;
held: (<verb-sp,pp> & <vc-hold>) or (<verb-pv-b> & {K+ or Vh+} & {@MV+}) or 
({@E-} & A+) or ({K+ or Vh+} & <verb-po>);
holding.v: <verb-pg> & <vc-hold>;
holding.g: (<vc-hold> & <verb-ge>) or <verb-ge-d>;

<vc-expect>: ({@MV+} & (Ce+ or TH+ or RSe+ or Z- or TO+))
or ((O+ or OX+ or B-) & {@MV+} & {TOo+}) or ([[@MV+ & O*n+]]);
expect claim.v: <verb-pl,i> & <vc-expect>;
expects claims.v: <verb-s> & <vc-expect>;
expected claimed.v: (<verb-sp,pp> & <vc-expect>) or (<verb-s-pv> &
{TOf+ or THi+ or Z-}) or ({@E-} & A+) or ({@MV+} & {TO+} & <verb-po>);
expecting.g claiming.g: (<vc-expect> & <verb-ge>) or <verb-ge-d>;
expecting.v claiming.v: <verb-pg> & <vc-expect>;

<vc-intend>: ({@MV+} & (TH+ or Z- or TO+)) or
((O+ or OX+ or B-) & {@MV+} & TOo+);
intend: <verb-pl,i> & <vc-intend>;
intends: <verb-s> & <vc-intend>;
intended: (<verb-sp,pp> & <vc-intend>) or (<verb-pv> & {TO+ or Z- or @MV+})
 or ({@E-} & A+) or ({@MV+} & {TO+} & <verb-po>);
intending.g: (<vc-intend> & <verb-ge>) or <verb-ge-d>;
intending.v: <verb-pg> & <vc-intend>;

<vc-dare>: (N+ & I+) or ({@MV+} & TO+) or ((O+ or B-) & {@MV+} & TOo+); 
dare.v: <verb-pl,i> & <vc-dare>;
dares.v: <verb-s> & <vc-dare>;
dared: (<verb-sp,pp> & <vc-dare>) or (<verb-pv> & TO+) or 
({@MV+} & TO+ & <verb-po>);
daring.g: (<vc-dare> & <verb-ge>) or <verb-ge-d>;
daring.v: <verb-pg> & <vc-dare>;

<vc-like>: ({@MV+} & (TO+ or Pg+)) or ((O+ or B- or OX+) & {@MV+} & {TOo+})
or ([[@MV+ & O*n+]]);
like.v: <verb-pl,i> & <vc-like>;
likes: <verb-s> & <vc-like>;
liked: (<verb-sp,pp> & <vc-like>) or <verb-pv> or <verb-po>;
liking.g: (<vc-like> & <verb-ge>) or <verb-ge-d>;
liking.v: <verb-pg> & <vc-like>;

<vc-offer>: (((O+ & {{[[@MV+]]} & O*n+}) or (B- & {O+})) & {@MV+}) or 
({@MV+} & TO+) or ([[@MV+ & O*n+]]);
offer.v: <verb-pl,i> & <vc-offer>;
offers.v: <verb-s> & <vc-offer>;
offered: (<verb-sp,pp> & <vc-offer>) or (<verb-pv-b> & {O+ or B-
or [[@MV+ & O*n+]]} & {@MV+}) or ({O+ or [[@MV+ & O*n+]]} or <verb-po>);
offering.g: (<vc-offer> & <verb-ge>) or <verb-ge-d>;
offering.v: <verb-pg> & <vc-offer>;

<vc-refuse>: (((O+ & {{[[@MV+]]} & O*n+}) or (B- & {O+})) & {@MV+}) or 
({@MV+} & {TO+}) or ([[@MV+ & O*n+]]);
refuse.v: <verb-pl,i> & <vc-refuse>;
refuses.v: <verb-s> & <vc-refuse>;
refused: (<verb-sp,pp> & <vc-refuse>) or (<verb-pv-b> & {O+ or B- or
[[@MV+ & O*n+]]} & {@MV+}) or ({O+ or [[@MV+ & O*n+]]} or <verb-po>);
refusing.g: (<vc-refuse> & <verb-ge>) or <verb-ge-d>;
refusing.v: <verb-pg> & <vc-refuse>;

<vc-want>: ({@MV+} & TO+) or ((O+ or OX+ or B-) & {@MV+} & {TOo+ or Pv+}) or
([[@MV+ & O*n+]]);
want need.v: <verb-pl,i> & <vc-want>;
need.i: {@E-} & (S- or (RS- & B-)) & (N+ & I+);
wants needs.v: <verb-s> & <vc-want>;
wanted needed: (<verb-sp,pp> & <vc-want>) or <verb-pv> or ({@E-} & A+)
or <verb-po>;
wanting.g needing.g: (<vc-want> & <verb-ge>) or <verb-ge-d>;
wanting.v needing.v: <verb-pg> & <vc-want>;

<vc-choose>: ({@MV+} & TO+) or ((O+ or B-) & {@MV+} & {TOo+}) or 
([[@MV+ & O*n+]]);
choose: <verb-pl,i> & <vc-choose>;
chooses: <verb-s> & <vc-choose>;
chose: <verb-sp> & <vc-choose>;
chosen: (<verb-pp> & <vc-choose>) or (<verb-pv> & {TO+}) or ({@E-} & A+)
or ({@MV+} & {TO+} & <verb-po>);
choosing.g: (<vc-choose> & <verb-ge>) or <verb-ge-d>;
choosing.v: <verb-pg> & <vc-choose>;

<vc-prepare>: ({@MV+} & {TO+}) or ((O+ or B-) & {@MV+} & {TOo+}) or
([[@MV+ & O*n+]]);
prepare press.v: <verb-pl,i> & <vc-prepare>;
prepares presses.v: <verb-s> & <vc-prepare>;
prepared.v pressed: (<verb-sp,pp> & <vc-prepare>) or <verb-pv> or 
({@E-} & A+) or <verb-po>;
preparing.g pressing.g: (<vc-prepare> & <verb-ge>) or <verb-ge-d>;
preparing.v pressing.v: <verb-pg> & <vc-prepare>;

<vc-require>: ((O+ or B-) & {@MV+} & {TOo+}) or
 ({@MV+} & (TH+ or Ce+ or RSe+ or TS+ or (SI*j+ & I*j+))) or 
([[@MV+ & O*n+]]);
require: <verb-pl,i> & <vc-require>;
requires: <verb-s> & <vc-require>;
required: (<verb-sp,pp> & <vc-require>) or 
(<verb-pv> & {TO+ or TSi+}) or ({@E-} & A+) or ({@MV+} & {TO+} & <verb-po>);
requiring.g: (<vc-require> & <verb-ge>) or <verb-ge-d>;
requiring.v: <verb-pg> & <vc-require>;

<vc-command>: ({@MV+} & (TH+ or Zs- or TS+ or (SI*j+ & I*j+))) or
((O+ or B-) & {@MV+} & {TOo+}) or ([[@MV+ & O*n+]]);
command.v order.v: <verb-pl,i> & <vc-command>;
commands.v orders.v: <verb-s> & <vc-command>;
commanded.v ordered.v: 
(<verb-sp,pp> & <vc-command>) or (<verb-pv> & {TO+ or TH+ or TS+}) 
or ({@MV+} & {TH+ or TO+ or TS+} & <verb-po>);
commanding.g ordering.g: (<vc-command> & <verb-ge>) or <verb-ge-d>;
commanding.v ordering.v: <verb-pg> & <vc-command>;

<vc-consider>: ({@MV+} & (TH+ or Pg+)) or ((O+ or OX+ or B-) & {@MV+} & {TOo+
or Pa+}) or (((O+ & (B- or ({[[@MV+]]} & O*n+))) or 
([[@MV+ & O*n+]])) & {@MV+});
consider: <verb-pl,i> & <vc-consider>;
considers: <verb-s> & <vc-consider>;
considered: (<verb-sp,pp> & <vc-consider>) or (<verb-s-pv-b> & 
(({@MV+} & (TOf+ or Pa+)) or ({O+ or B- or [[@MV+ & O*n+]]} & {@MV+})))
or ((({@MV+} & (TOf+ or Pa+)) or ({O+ or [[@MV+ & O*n+]]}))
& <verb-po>);
considering.g: (<vc-consider> & <verb-ge>) or <verb-ge-d>;
considering.v: <verb-pg> & <vc-consider>;

<vc-perceive>: ({@MV+} & TH+) or Ce+ or ((O+ or OX+ or B-) & {@MV+} & {TOo+})
or ([[@MV+ & O*n+]]);
perceive: <verb-pl,i> & <vc-perceive>;
perceives: <verb-s> & <vc-perceive>;
perceived: (<verb-sp,pp> & <vc-perceive>) or (<verb-pv> & {TO+}) or 
({@E-} & A+) or ({@MV+} & {TO+} & <verb-po>);
perceiving.g: (<vc-perceive> & <verb-ge>) or <verb-ge-d>;
perceiving.v: <verb-pg> & <vc-perceive>;

<vc-report>: ({@MV+} & {TH+ or Z-}) or Ce+ or 
((O+ or B-) & {@MV+} & {TOo+}) or ([[@MV+ & O*n+]]);
report.v: <verb-pl,i> & <vc-report>;
reports.v: <verb-s> & <vc-report>;
reported.v: (<verb-sp,pp> & <vc-report>) or (<verb-s-pv> & {TOf+ or Z-}) or 
({@E-} & A+) or ({@MV+} & {TO+} & <verb-po>);
reporting.g: (<vc-report> & <verb-ge>) or <verb-ge-d>;
reporting.v: <verb-pg> & <vc-report>;

<vc-caution>: ((O+ or B-) & {@MV+} & 
{TH+ or Ce+ or TOo+}) or ({@MV+} & {TH+ or Zs-}) or ([[@MV+ & O*n+]]);
caution.v: <verb-pl,i> & <vc-caution>;
cautions.v: <verb-s> & <vc-caution>;
cautioned: (<verb-sp,pp> & <vc-caution>) or (<verb-pv> &
((O+ or B-) & {@MV+} & 
{TH+ or Ce+ or Zs- or TO+})) or ({@MV+} & {TH+ or Ce+ or TO+} & <verb-po>);
cautioning.g: (<vc-caution> & <verb-ge>) or <verb-ge-d>;
cautioning.v: <verb-pg> & <vc-caution>;

<vc-warn>: ((O+ or B-) & {@MV+} & 
{TH+ or Ce+ or TOo+ or OF+}) or ({@MV+} & {TH+ or Zs- or (OF+ & {@MV+})}) 
or ([[@MV+ & O*n+]]);
warn.v advise: <verb-pl,i> & <vc-warn>;
warns.v advises: <verb-s> & <vc-warn>;
warned.v advised: 
(<verb-sp,pp> & <vc-warn>) or (<verb-pv> &
{TH+ or Ce+ or Zs- or TO+ or (OF+ & {@MV+})}) 
or ({@MV+} & {TH+ or Ce+ or TO+ or OF+} & <verb-po>);
warning.g advising.g: (<vc-warn> & <verb-ge>) or <verb-ge-d>;
warning.v advising.v: <verb-pg> & <vc-warn>;

<vc-hear>: ((B- or O+) &
{@MV+} & {I*j+ or Pg+}) or ({@MV+} & {TH+ or Zs- or OF+}) or Ce+ or 
([[@MV+ & O*n+]]);
hear: <verb-pl,i> & <vc-hear>;
hears: <verb-s> & <vc-hear>;
heard: (<verb-sp,pp> & <vc-hear>) or (<verb-pv> & {Pg+}) or ({@MV+} & 
{Pg+} & <verb-po>);
hearing.g: (<vc-hear> & <verb-ge>) or <verb-ge-d>;
hearing.v: <verb-pg> & <vc-hear>;

<vc-see>: ((B- or O+) &
{@MV+} & {I*j+ or Pg+ or AZ+}) or ({@MV+} & {TH+ or Zs- or QI+}) or Ce+ or 
([[@MV+ & O*n+]]);
see: <verb-pl,i> & <vc-see>;
sees: <verb-s> & <vc-see>;
saw.v: <verb-sp> & <vc-see>;
seen: (<verb-pp> & <vc-see>) or (<verb-pv> & {Pg+ or AZ+}) or
({@MV+} & {Pg+ or AZ+} & <verb-po>);
seeing.g: (<vc-see> & <verb-ge>) or <verb-ge-d>;
seeing.v: <verb-pg> & <vc-see>;

<vc-owe>: ((O+ & {{[[@MV+]]} & O*n+}) or (B- & {O+}) or 
([[@MV+ & O*n+]])) & {@MV+};
owe deliver accord.v award.v term.v grant.v begrudge assign rename repay
dub.v: 
<verb-pl,i> & <vc-owe>;
owes delivers accords.v awards.v terms.v grants.v begrudges assigns renames
repays dubs.v: 
 <verb-s> & <vc-owe>;
owed delivered accorded awarded termed
granted.v begrudged assigned renamed repaid dubbed.v: 
(<verb-sp,pp> & <vc-owe>) or (<verb-pv-b> &
{O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or 
({O+ or [[@MV+ & O*n+]]} & <verb-po>);
owing.v delivering.v according.v awarding.v terming.v granting.v
begrudging.v assigning.v renaming.v repaying.v dubbing.v: 
<verb-pg> & <vc-owe>;
owing.g delivering.g according.g awarding.g terming.g granting.g begrudging.g
assigning.g renaming.g repaying.g dubbing.g: 
(<vc-owe> & <verb-ge>) or <verb-ge-d>;

<vc-give>: ((B- & {O+ or K+}) or (O+ & {({[[@MV+]]} & O*n+) or K+}) or 
(K+ & ({[[@MV+]]} & O*n+)) or ([[@MV+ & O*n+]])) & {@MV+};
give send buy bring lend issue.v hand.v: <verb-pl,i> & <vc-give>;
gives sends buys brings lends
issues.v hands.v: <verb-s> & <vc-give>;
sent bought brought lent handed: (<verb-sp,pp> & <vc-give>)
or (<verb-pv-b> & {O+ or B- or K+ or [[@MV+ & O*n+]]} & {@MV+}) 
or ({O+ or K+ or [[@MV+ & O*n+]]} & <verb-po>);
issued: (<verb-sp,pp> & <vc-give>)
or (<verb-pv-b> & {O+ or B- or K+ or [[@MV+ & O*n+]]} & {@MV+}) 
or ({O+ or K+ or [[@MV+ & O*n+]]} & <verb-po>) or ({@E-} & A+);
gave: <verb-sp> & <vc-give>;
given: (<verb-pp> & <vc-give>) or (<verb-pv-b> & {O+ or B- or K+
or [[@MV+ & O*n+]]} & {@MV+}) or ({O+ or K+ or [[@MV+ & O*n+]]} & <verb-po>);
% Mv- & B- used together: That is a gift I know many people given.
giving.g sending.g buying.g bringing.g 
lending.g issuing.g handing.g: (<vc-give> & <verb-ge>) or <verb-ge-d>;
giving.v sending.v buying.v bringing.v lending.v issuing.v
handing.v: <verb-pg> & <vc-give>;

<vc-pass>: {(B- & {O+ or K+}) or (O+ & {({[[@MV+]]} & O*n+) or K+}) or 
(K+ & {{[[@MV+]]} & O*n+}) or ([[@MV+ & O*n+]])} & {@MV+};
pass.v pay.v sell deal.v: <verb-pl,i> & <vc-pass>;
passes.v pays sells deals.v: <verb-s> & <vc-pass>;
passed paid sold dealt.v: 
(<verb-sp,pp> & <vc-pass>) or (<verb-pv-b> & {O+ or B- or K+
or [[@MV+ & O*n+]]} & {@MV+}) or ({O+ or K+ or [[@MV+ & O*n+]]} & <verb-po>);
passing.g paying.g selling.g dealing.g: 
(<vc-pass> & <verb-ge>) or <verb-ge-d>;
passing.v paying.v selling.v dealing.v: <verb-pg> & <vc-pass>;

<vc-call>: {(B- & {O+ or Pa+ or K+}) or (O+ & {({[[@MV+]]} & O*n+) or 
Pa+ or K+}) or (K+ & {{[[@MV+]]} & O*n+}) or ([[@MV+ & O*n+]])} & {@MV+};
call.v: <verb-pl,i> & <vc-call>;
calls.v: <verb-s> & <vc-call>;
called: (<verb-sp,pp> & <vc-call>) or (<verb-pv-b> & {O+ or B- or K+ or Pa+
or [[@MV+ & O*n+]]} & {@MV+}) or ({O+ or K+ or Pa+ or 
[[@MV+ & O*n+]]} & <verb-po>);
calling.g: (<vc-call> & <verb-ge>) or <verb-ge-d>;
calling.v: <verb-pg> & <vc-call>;

<vc-write>: ({(B- & {O+ or K+}) or (O+ & {({[[@MV+]]} & O*n+) or K+}) or 
(K+ & {{[[@MV+]]} & O*n+}) or ([[@MV+ & O*n+]])} & {@MV+})
or ({@MV+} & TH+) or Ce+;
write.v charge.v: <verb-pl,i> & <vc-write>;
writes.v reads.v charges.v: <verb-s> & <vc-write>;
wrote.v: <verb-sp> & <vc-write>;
read.v: ((<verb-pl,i> or <verb-sp,pp>) & <vc-write>) or (<verb-pv-b> &
{O+ or B- or K+ or [[@MV+ & O*n+]]} & {@MV+}) or ({O+ or K+ or 
[[@MV+ & O*n+]]} & <verb-po>);
charged.v: (<verb-sp,pp> & <vc-write>) or (<verb-pv-b> & {O+ or B- or K+
or [[@MV+ & O*n+]]} & {@MV+}) or ({O+ or K+ or [[@MV+ & O*n+]]} & <verb-po>);
written.v: (<verb-pp> & <vc-write>) or (<verb-pv-b> & {O+ or B- or K+
or [[@MV+ & O*n+]]} & {@MV+}) or ({O+ or K+ or [[@MV+ & O*n+]]} & <verb-po>)
or ({@E-} & A+);
writing.g reading.g charging.g: (<vc-write> & <verb-ge>) or <verb-ge-d>;
writing.v reading.v charging.v: <verb-pg> & <vc-write>;

<vc-allow>: (((O+ & {[[@MV+]]} & O*n+) or ([[@MV+]] & O*n+)) & {@MV+}) or 
((O+ or B-) & {@MV+} & {B- or TOo+});
allow: <verb-pl,i> & <vc-allow>;
allows: <verb-s> & <vc-allow>;
allowed: (<verb-sp,pp> & <vc-allow>) or 
(<verb-pv-b> & (({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or ({@MV+} & TO+)))
or ({O+ or [[@MV+ & O*n+]] or ({@MV+} & TO+)} & <verb-po>);
allowing.g: (<vc-allow> & <verb-ge>) or <verb-ge-d>;
allowing.v: <verb-pg> & <vc-allow>;

<vc-promise>:
({O+ or B-} & {@MV+} & {B- or TO+ or Ce+ or TH+ or RSe+ or Zs-}) or 
(((O+ & {[[@MV+]]} & O*n+) or ([[@MV+ & O*n+]])) & {@MV+});
promise.v: <verb-pl,i> & <vc-promise>;
promises.v: <verb-s> & <vc-promise>;
promised.v: (<verb-sp,pp> & <vc-promise>) or (<verb-pv-b> & 
(({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or 
({@MV+} & (TO+ or Ce+ or TH+ or RSe+ or Zs-)))) or ({@E-} & A+) or
({O+ or [[@MV+ & O*n+]] or ({{@MV+} & (TO+ or Ce+ or TH+)})} & <verb-po>);
promising.g: (<vc-promise> & <verb-ge>) or <verb-ge-d>;
promising.v: <verb-pg> & <vc-promise>;

<vc-show>: ({O+ or B-} & ({@MV+} & (QI+ or Ce+ or TH+ or RSe+ or Zs- or B-)))
or (((O+ & {K+ or ({[[@MV+]]} & O*n+)}) or (K+ & (B- or ({[[@MV+]]} & O*n+))) 
or ([[@MV+ & O*n+]])) & {@MV+});
show.v: <verb-pl,i> & <vc-show>;
shows.v: <verb-s> & <vc-show>;
showed: <verb-sp> & <vc-show>;
shown: (<verb-pp> & <vc-show>) or (<verb-s-pv-b> & 
(({O+ or K+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or
({@MV+} & (QI+ or Ce+ or TH+ or RSe+ or Zs-)))) or 
({O+ or K+ or [[@MV+ & O*n+]] or ({@MV+} & (QI+ or Ce+ or TH+))} & <verb-po>);
showing.g: (<vc-show> & <verb-ge>) or <verb-ge-d>;
showing.v: <verb-pg> & <vc-show>;

<vc-teach>: ((O+ or B-) & ({@MV+} & (QI+ or Ce+ or TH+ or RSe+ or Zs- or B-
or TOo+))) or
((((O+ or B-) & ({[[@MV+]]} & O*n+)) or ([[@MV+ & O*n+]])) & {@MV+});
teach: <verb-pl,i> & <vc-teach>;
teaches: <verb-s> & <vc-teach>;
taught: (<verb-sp,pp> & <vc-teach>) or (<verb-pv-b> & 
(({O+ or B- or [[@MV+ & O*n+]]} & {@MV+}) or
({@MV+} & (QI+ or Ce+ or TH+ or RSe+ or Zs- or TO+)))) or 
({O+ or [[@MV+ & O*n+]] or ({@MV+} & (QI+ or Ce+ or TH+))} & <verb-po>);
teaching.g: (<vc-teach> & <verb-ge>) or <verb-ge-d>;
teaching.v: <verb-pg> & <vc-teach>;

<vc-compel>: ((O+ or B-) & {@MV+} & TOo+);
compel: <verb-pl,i> & <vc-compel>;
compels: <verb-s> & <vc-compel>;
compelled: (<verb-sp,pp> & <vc-compel>) or (<verb-pv> & TO+)
or ({@MV+} & TO+ & <verb-po>);
compelling.v: <verb-pg> & <vc-compel>;
compelling.g: (<vc-compel> & <verb-ge>) or <verb-ge-d>;

<vc-force>: (((O+ or B-) & (({@MV+} & TOo+) or K+ or [()])) or (K+ & O*n+)
or ([[{K+} & @MV+ & O*n+]])) & {@MV+};
force.v: <verb-pl,i> & <vc-force>;
forces.v: <verb-s> & <vc-force>;
forced: (<verb-sp,pp> & <vc-force>) or (<verb-pv-b> & ((K+ & {@MV+}) or 
({@MV+} & TO+))) or ((K+ or ({@MV+} & TO+)) & <verb-po>);
forcing.g: (<vc-force> & <verb-ge>) or <verb-ge-d>;
forcing.v: <verb-pg> & <vc-force>;

<vc-design>: ((O+ or B-) & {@MV+} & {TOo+}) or ([[@MV+ & O*n+]]);
design.v permit.v authorize use.v cause.v enable
pressure.v train.v sentence.v prompt.v spur.v
urge.v invite reelect encourage draft.v hire entice inspire aid.v
forbid employ educate tempt condemn commission.v counsel.v induce instruct
oblige license.v incite nominate destine provoke challenge.v exhort.v
implore.v motivate.v impel.v: 
<verb-pl,i> & <vc-design>;
designs.v permits.v pressures.v trains.v sentences.v causes.v enables
authorizes uses.v prompts.v spurs.v urges.v 
invites reelects encourages drafts.v hires entices inspires aids.v
forbids employs educates tempts condemns commissions.v counsels induces
instructs obliges licenses.v incites nominates destines provokes
challenges.v exhorts.v implores.v motivates.v impels.v: 
<verb-s> & <vc-design>;
designed permitted pressured trained sentenced caused enabled
authorized prompted spurred urged invited
reelected encouraged drafted hired enticed inspired aided employed
educated.v tempted condemned commissioned counseled induced instructed
obliged licensed incited nominated destined provoked challenged exhorted
implored motivated impelled:
(<verb-sp,pp> & <vc-design>) or (<verb-pv> & {TO+}) or ({@E-} & A+)
or ({{@MV+} & TO+} & <verb-po>);
forbade: <verb-sp> & <vc-design>;
forbidden: (<verb-pp> & <vc-design>) or (<verb-pv> & {TO+}) or ({@E-} & A+)
or ({{@MV+} & TO+} & <verb-po>);
designing.g permitting.g pressuring.g causing.g enabling.g
training.g sentencing.g authorizing.g prompting.g 
spurring.g urging.g inviting.g 
reelecting.g encouraging.g drafting.g hiring.g
enticing.g inspiring.g aiding.g employing.g educating.g tempting.g
condemning.g commissioning.g counseling.g inducing.g instructing.g obliging.g
licensing.g inciting.g nominating.g destining.g provoking.g challenging.g
exhorting.g imploring.g motivating.g impelling.g:
(<vc-design> & <verb-ge>) or <verb-ge-d>;
designing.v permitting.v pressuring.v causing.v enabling.v
training.v sentencing.v authorizing.v using.v prompting.v 
spurring.v urging.v inviting.v reelecting.v encouraging.v drafting.v hiring.v
enticing.v inspiring.v aiding.v employing.v educating.v tempting.v
condemning.v commissioning.v counseling.v inducing.v instructing.v obliging.v
licensing.v inciting.v nominating.v destining.v provoking.v challenging.v
exhorting.v imploring.v motivating.v impelling.v:
<verb-pg> & <vc-design>;
used: (<verb-sp,pp> & <vc-design>) or (<verb-pv> & {TOo+}) or (<verb-sp> & 
TO+) or ({@MV+} & {TOo+} & <verb-po>) or ({@E-} & A+);
using.g: (<vc-design> & (<verb-ge> or MVs-)) or <verb-ge-d>;

<vc-elect>: ((O+ or B-) & (({@MV+} & {TOo+}) or ({[[@MV+]]} & (O*n+ or TI+))))
 or ([[@MV+ & O*n+]]);
elect appoint: <verb-pl,i> & <vc-elect>;
elects appoints: <verb-s> & <vc-elect>;
elected appointed: (<verb-sp,pp> & <vc-elect>) or (<verb-pv-b> & (({B- or
(O+ or TI+ or [[@MV+ & (O*n+ or TI+)]])} & {@MV+}) or ({@MV+} & TO+))) 
or (({O+ or TI+ or [[@MV+ & (O*n+ or TI+)]]} or ({@MV+} & TO+)) & <verb-po>)
or ({@E-} & A+);
electing.g appointing.g: (<vc-elect> & <verb-ge>) or <verb-ge-d>;
electing.v appointing.v: <verb-pg> & <vc-elect>;

<vc-name>: ((O+ & {{[[@MV+]]} & (O*n+ or TI+)}) or (B- & {O+ or TI+}) or 
([[@MV+ & O*n+]])) & {@MV+};
name.v: <verb-pl,i> & <vc-name>;
names.v: <verb-s> & <vc-elect>;
named: (<verb-sp,pp> & <vc-name>) or (<verb-pv-b> & ({B- or
(O+ or TI+ or [[@MV+ & (O*n+ or TI+)]])}) & {@MV+}) or 
({O+ or TI+ or [[@MV+ & (O*n+ or TI+)]]} & <verb-po>);
naming.g: (<vc-name> & <verb-ge>) or <verb-ge-d>;
naming.v: <verb-pg> & <vc-name>;

<vc-program>: {((O+ or B-) & {@MV+} & {TOo+}) or @MV+ or ([[@MV+ & O*n+]])};
program.v: <verb-pl,i> & <vc-program>;
programs.v: <verb-s> & <vc-program>;
programmed: (<verb-sp,pp> & <vc-program>) or (<verb-pv> & {TO+}) or 
({@E-} & A+) or ({{@MV+} & TO+} & <verb-po>);
programming.g: (<vc-program> & <verb-ge>) or <verb-ge-d>;
programming.v: <verb-pg> & <vc-program>;

<vc-convince>: ((O+ or B-) & {@MV+} & {TOo+ or TH+}) or Ce+ or 
([[@MV+ & O*n+]]);
convince.v persuade.v: <verb-pl,i> & <vc-convince>;
convinces.v persuades.v: <verb-s> & <vc-convince>;
convinced.v persuaded.v: (<verb-sp,pp> & <vc-convince>) or (<verb-pv> & 
{TO+ or TH+ or Ce+}) or ({{@MV+} & (TO+ or TH+ or Ce+)} & <verb-po>);
convincing.g persuading.g: (<vc-convince> & <verb-ge>) or <verb-ge-d>;
convincing.v persuading.v: <verb-pg> & <vc-convince>;

<vc-tell>: ((O+ or B-) & {@MV+} & 
{TH+ or Ce+ or RSe+ or Zs- or TOo+ or QI+ or BW-}) or ([[@MV+ & O*n+]]);
tell.v: <verb-pl,i> & <vc-tell>;
tell.i: {@E-} & I- & {@MV+} & (QI+ or TH+ or Ce+ or RSe+ or Zs-);
tells.v: <verb-s> & <vc-tell>;
told.v: (<verb-sp,pp> & <vc-tell>) or (<verb-pv> & 
{TH+ or Ce+ or RSe+ or Zs- or TO+ or QI+ or BW-}) or ({{@MV+} &
(Ce+ or TO+ or QI+ or TH+)} & <verb-po>);
telling.g: (<vc-tell> & <verb-ge>) or <verb-ge-d>;
telling.v: <verb-pg> & <vc-tell>;

<vc-ask>: ({O+ or B-} & {@MV+} & {TS+ or TOo+ or QI+ or BW-}) or 
([[@MV+ & O*n+]]);
ask.v: <verb-pl,i> & <vc-ask>;
asks.v: <verb-s> & <vc-ask>;
asked.v: (<verb-sp,pp> & <vc-ask>) or (<verb-pv> & {TO+ or QI+ or BW- or TH+ or
 TS+}) or ({{@MV+} & (TO+ or QI+ or TH+ or TS+)} or <verb-po>);
asking.g: (<vc-ask> & <verb-ge>) or <verb-ge-d>;
asking.v: <verb-pg> & <vc-ask>;

<vc-help>: ({O+ or B-} & {@MV+} & {TO+ or I+}) or ([[@MV+ & O*n+]]);
help.v: <verb-pl,i> & <vc-help>;
helps: <verb-s> & <vc-help>;
helped: (<verb-sp,pp> & <vc-help>) or (<verb-pv> & {TO+}) or 
({{@MV+} & TO+} or <verb-po>);
helping.g: (<vc-help> & <verb-ge>) or <verb-ge-d>;
helping.v: <verb-pg> & <vc-help>;

<vc-remind>: ((O+ or B-) & {@MV+} & (TOo+ or TH+ or (OF+ & {@MV+}))) or Ce+ or
([[@MV+ & O*n+]]);
remind.v: <verb-pl,i> & <vc-remind>;
reminds.v: <verb-s> & <vc-remind>;
reminded.v: (<verb-sp,pp> & <vc-remind>) or (<verb-pv> & {TO+ or TH+ or
	(OF+ & {@MV+})}) or ({{@MV+} & (TO+ or TH+ or OF+)} or <verb-po>);
reminding.g: (<vc-remind> & <verb-ge>) or <verb-ge-d>;
reminding.v: <verb-pg> & <vc-remind>;

<vc-inform>: ((O+ or B-) & {@MV+} & {(OF+ & {@MV+}) or TH+ or Zs-}) or 
Ce+ or ([[@MV+ & O*n+]]);
inform.v reassure alert.v guarantee.v notify.v forewarn.v: 
<verb-pl,i> & <vc-inform>;
informs.v reassures alerts.v guarantees.v notifies.v forewarns.v: 
<verb-s> & <vc-inform>;
informed.v reassured alerted.v guaranteed.v notified.v forewarned.v: 
(<verb-sp,pp> & <vc-inform>) or (<verb-pv> & 
{TH+ or Zs- or (OF+ & {@MV+})}) or ({{@MV+} & (TH+ or OF+)} or <verb-po>);
informing.g reassuring.g alerting.g guaranteeing.g notifying.g forewarning.g: 
(<vc-inform> & <verb-ge>) or <verb-ge-d>;
informing.v reassuring.v alerting.v guaranteeing.v notifying.v forewarning.v: 
<verb-pg> & <vc-inform>;

<vc-assure>: ((O+ or B-) & {@MV+} & {(OF+ & {@MV+}) or TH+ or Zs-}) 
or Ce+ or ([[@MV+ & O*n+]]) or ({@MV+} & TH+) or Ce+;
assure.v: <verb-pl,i> & <vc-assure>;
assures.v: <verb-s> & <vc-assure>;
assured.v: (<verb-sp,pp> & <vc-assure>) or (<verb-pv> & 
{(OF+ & {@MV+}) or TH+ or Zs-}) or ({{@MV+} & (TH+ or OF+)} or <verb-po>);
assuring.g: (<vc-assure> & <verb-ge>) or <verb-ge-d>;
assuring.v: <verb-pg> & <vc-assure>;

<vc-let>: ((B- or O+) & {@MV+} & {I+ or ((K+ or Pp+) & {@MV+})}) 
or ([[@MV+ & O*n+]]);
let: ((<verb-pl,i> or <verb-sp,pp>) & <vc-let>) or (<verb-pv-b> 
& ((K+ or Pp+) & {@MV+})) or ((K+ or Pp+) & <verb-po>);
let's: Wi- & I+;
lets: <verb-s> & <vc-let>;
letting.g: (<vc-let> & <verb-ge>) or <verb-ge-d>;
letting.v: <verb-pg> & <vc-let>;

<vc-watch>: ((B- or O+) & {@MV+} & {I*j+ or Pg+}) or ([[@MV+ & O*n+]])
or {@MV+};
watch.v: <verb-pl,i> & <vc-watch>;
watches.v: <verb-s> & <vc-watch>;
watched: (<verb-sp,pp> & <vc-watch>) or <verb-pv> or <verb-po>;
watching.g: (<vc-watch> & <verb-ge>) or <verb-ge-d>;
watching.v: <verb-pg> & <vc-watch>;

<vc-appreciate>: ((B- or O+) & {@MV+} & {Pg+}) or ([[@MV+ & O*n+]]);
appreciate spend: <verb-pl,i> & <vc-appreciate>;
appreciates spends: <verb-s> & <vc-appreciate>;
appreciated spent: (<verb-sp,pp> & <vc-appreciate>) or (<verb-pv> & {Pg+})
or ({{@MV+} & Pg+} & <verb-po>);
appreciating.g spending.g: (<vc-appreciate> & <verb-ge>) or <verb-ge-d>;
appreciating.v spending.v: <verb-pg> & <vc-appreciate>;

<vc-make>: ((B- or O+ or OX+) & {({@MV+} & {I*j+ or Pa**j+ or B-}) or 
((K+ or AF-) & {@MV+})}) or ((((O+ or K+) & {[[@MV+]]} & O*n+) or K+ or MI+ or
([[{K+} & @MV+ & O*n+]])) & {@MV+});
make: <verb-pl,i> & <vc-make>;
makes: <verb-s> & <vc-make>;
made: (<verb-sp,pp> & <vc-make>) or (<verb-s-pv-b> & 
(({@MV+} & Pa+) or ({K+} & {@MV+}) or MIi+)) or ({({@MV+} & Pa+) or K+} & 
<verb-po>);
made_of made_up_of: (<verb-pv-b> & (B- or O+) & {@MV+}) or (O+ & <verb-po>);
making.g: (<vc-make> & <verb-ge>) or <verb-ge-d>;
making.v: <verb-pg> & <vc-make>;
% we made him director?

<vc-render>: (((B- or O+) & {({@MV+} & Pa+) or AF-}) or ([[@MV+ & O*n+]]))
 & {@MV+};
render deem: <verb-pl,i> & <vc-render>;
renders deems: <verb-s> & <vc-render>;
rendered deemed: (<verb-sp,pp> & <vc-render>) or (<verb-pv> & {Pa+ or AF-})
or ({{@MV+} & Pa+} & <verb-po>);
rendering.g deeming.g: (<vc-render> & <verb-ge>) or <verb-ge-d>;
rendering.v deeming.v: <verb-pg> & <vc-render>;

<vc-deprive>: (((O+ or B-) & {{@MV+} & OF+}) or ([[@MV+ & O*n+]])) & {@MV+};
deprive accuse acquit purge.v disabuse exonerate absolve: 
<verb-pl,i> & <vc-deprive>;
deprives accuses acquits purges.v disabuses.v
exonerates absolves: <verb-s> & <vc-deprive>;
deprived accused acquitted purged disabused exonerated absolved: 
(<verb-sp,pp> & <vc-deprive>) or (<verb-pv> & {OF+} & {@MV+}) 
or ({@E-} & A+) or ({{@MV+} & OF+} & <verb-po>);
depriving.g accusing.g acquitting.g purging.g disabusing.g exonerating.g
absolving.g: 
(<vc-deprive> & <verb-ge>) or <verb-ge-d>;
depriving.v accusing.v acquitting.v purging.v disabusing.v
exonerating.v absolving.v: <verb-pg> & <vc-deprive>;

<vc-clear>: (((O+ or B-) & {({@MV+} & OF+) or K+}) or 
({K+} & O*n+) or K+ or ([[{K+} & @MV+ & O*n+]])) & {@MV+};
clear.v: <verb-pl,i> & <vc-clear>;
clears.v: <verb-s> & <vc-clear>;
cleared: (<verb-sp,pp> & <vc-clear>) or (<verb-pv-b> & {({@MV+} & OF+)
 or K+} & {@MV+}) or ({K+ or ({@MV+} & OF+)} & <verb-po>);
clearing.g: (<vc-clear> & <verb-ge>) or <verb-ge-d>;
clearing.v: <verb-pg> & <vc-clear>;

<vc-bet>: ({(O+ & {O*n+}) or (B- & {O+})} & {@MV+} & {TH+ or Ce+ or RSe+})
or ([[@MV+ & O*n+ & {@MV+}]]);
bet.v: ((<verb-pl,i> or <verb-sp,pp>) & <vc-bet>) or (<verb-pv> & {O+ or B-} &
{@MV+} & {TH+ or Ce+ or RSe+ or @MV+}); 
bets.v: <verb-s> & <vc-bet>;
betted: (<verb-sp,pp> & <vc-bet>) or (<verb-pv-b> & {O+ or B-} & {@MV+}
& {TH+ or Ce+ or RSe+ or @MV+}) or ({O- or [[@MV+ & O*n+]] or TH+ or Ce+}
& <verb-po>); 
betting.g: (<vc-bet> & <verb-ge>) or <verb-ge-d>;
betting.v: <verb-pg> & <vc-bet>;

<vc-bother>: ({@MV+} & TO+) or ((O+ or B-) & {@MV+} & {THi+}) or 
([[@MV+ & O*n+ & {@MV+}]]);
bother.v: <verb-s-pl,i> & <vc-bother>;
bothers.v: <verb-s-s> & <vc-bother>;
bothered: (<verb-s-sp,pp> & <vc-bother>) or <verb-pv> or <verb-po>;
bothering.v: <verb-s-pg> & <vc-bother>;
bothering.g: (<vc-bother> & <verb-ge>) or <verb-ge-d>;

<vc-surprise>: ((O+ or B-) & {@MV+} & {THi+}) or ([[@MV+ & O*n+]]);
surprise.v alarm.v amaze amuse astonish astound excite depress
disgust.v distress.v dismay.v irritate embarrass annoy: 
<verb-s-pl,i> & <vc-surprise>;
surprises.v alarms.v amazes amuses astonishes astounds excites depresses
disgusts distresses dismays irritates embarrasses annoys: 
<verb-s-s> & <vc-surprise>;
surprised.v alarmed.v amazed.v amused.v astonished.v astounded.v excited.v
 depressed.v disgusted.v distressed.v dismayed.v irritated.v embarrassed.v 
annoyed.v: 
(<verb-s-sp,pp> & <vc-surprise>) or <verb-pv> or <verb-po>;
surprising.v alarming.v amazing.v amusing.v astonishing.v astounding.v
 exciting.v depressing.v disgusting.v distressing.v dismaying.v 
embarrassing.v annoying.v: 
<verb-s-pg> & <vc-surprise>;
surprising.g alarming.g amazing.g amusing.g astonishing.g astounding.g 
exciting.g depressing.g disgusting.g distressing.g dismaying.g 
embarrassing.g annoying.g: 
(<vc-surprise> & <verb-ge>) or <verb-ge-d>;

<vc-prove>: 
((O+ or B- or [[@MV+ & O*n+]]) & {@MV+}) or ((O+ or OX+ or B-) & {@MV+} 
& TOo+) or ({@MV+} & (TOf+ or TH+ or Ce+ or RSe+ or Zs-));
prove.v: <verb-x-pl,i> & <vc-prove>;
proves.v: <verb-x-s> & <vc-prove>;
proved.v: (<verb-x-sp,pp> & <vc-prove>) or (<verb-s-pv> & {THi+ or TOf+}) or 
({@E-} & A+) or <verb-po>;
proven.v: (<verb-x-pp> & <vc-prove>) or (<verb-s-pv> & {THi+ or TOf+}) or 
({@E-} & A+) or <verb-po>;
proving.g: (<vc-prove> & <verb-ge>) or <verb-ge-d>;
proving.v: <verb-x-pg> &  <vc-prove>;

<vc-suggest>: ((O+ or B- or [[@MV+ & O*n+]]) & {@MV+}) or ({@MV+} & 
(Pg+ or TH+ or Ce+ or RSe+ or Zs- or TS+ or ((SI*j+ or SFI**j+) & I*j+)));
suggest.v recommend: <verb-pl,i> & <vc-suggest>;
suggests.v recommends: <verb-s> & <vc-suggest>;
suggested.v recommended: (<verb-sp,pp> & <vc-suggest>) or 
(<verb-s-pv> & {THi+ or TSi+}) or ({@E-} & A+) or <verb-po>;
suggesting.g recommending.g: (<vc-suggest> & <verb-ge>) or <verb-ge-d>; 
suggesting.v recommending.v: <verb-pg> & <vc-suggest>;

<vc-deny>: (((O+ & {{[[@MV+]]} & O*n+}) or (B- & {O+}) or [[@MV+ & O*n+]]) 
& {@MV+}) or ({@MV+} & (Pg+ or TH+ or Ce+ or RSe+));
deny: <verb-pl,i> & <vc-deny>;
denies: <verb-s> & <vc-deny>;
denied: (<verb-sp,pp> & <vc-deny>) or (<verb-pv-b> & {O+ or B- or 
[[@MV+ & O*n+]]} & {@MV+}) or ({O+ or ([[@MV+ & O*n+]])} & <verb-po>);
denying.g: (<vc-deny> & <verb-ge>) or <verb-ge-d>;
denying.v: <verb-pg> & <vc-deny>;

<vc-describe>: ((O+ or B-) & {@MV+} & {AZ+}) or ({@MV+} & (QI+ or Z-))
or ([[@MV+ & O*n+ & {@MV+}]]);
describe: <verb-pl,i> & <vc-describe>;
describes: <verb-s> & <vc-describe>;
described: (<verb-sp,pp> & <vc-describe>) or (<verb-pv> & {AZ+ or Z-}) or 
({@E-} & A+) or ({@MV+} & {AZ+} & <verb-po>);
describing.g: (<vc-describe> & <verb-ge>) or <verb-ge-d>;
describing.v: <verb-pg> & <vc-describe>;

<vc-portray>: ((O+ or B-) & {@MV+} & {AZ+}) or ([[@MV+ & O*n+ & {@MV+}]]);
portray depict regard.v view.v characterize.v: <verb-pl,i> & <vc-portray>;
portrays depicts regards.v views.v characterizes.v: <verb-s> & <vc-portray>;
portrayed depicted regarded viewed.v characterized.v: 
(<verb-sp,pp> & <vc-portray>) 
or (<verb-pv> & {AZ+}) or ({@E-} & A+) or ({@MV+} & {AZ+} & <verb-po>);
portraying.g depicting.g regarding.g viewing.g characterizing.g: 
(<vc-portray> & <verb-ge>) or <verb-ge-d>;
portraying.v depicting.v regarding.v viewing.v characterizing.v: 
<verb-pg> & <vc-portray>;

%IDIOMATIC VERBS

do_so take_place show_up take_office do_battle give_way make_way
take_part catch_up catch_on file_suit pick_up take_off break_free
take_over: <verb-pl,i> & <vc-intrans>;
does_so takes_place shows_up pleads_guilty pleads_innocent
takes_office does_battle gives_way makes_way takes_part catches_up
catches_on files_suit picks_up takes_off breaks_free takes_over: 
<verb-s> & <vc-intrans>;
showed_up pleaded_guilty pleaded_innocent made_way caught_up caught_on
filed_suit picked_up:  
<verb-sp,pp> & <vc-intrans>;
plead_guilty plead_innocent: (<verb-pl,i> or <verb-sp,pp>) & <vc-intrans>;
did_so took_place took_office did_battle gave_way took_part took_off
broke_free took_over: 
<verb-sp> & <vc-intrans>;
done_so taken_place shown_up taken_office done_battle given_way
taken_part taken_off broken_free taken_over: <verb-pp> & <vc-intrans>;
doing_so taking_place showing_up pleading_guilty pleading_innocent
taking_office
doing_battle giving_way making_way taking_part catching_up catching_on
filing_suit picking_up taking_off breaking_free taking_over: 
(<vc-intrans> & <verb-pg,ge>) or <verb-ge-d>;

<vc-put-up-with>: (O+ or B- or [[@MV+ & O*n+]]) & {@MV+};
puts_up_with: <verb-s> & <vc-trans>;
put_up_with: (<verb-pl,i> or <verb-sp,pp>) & <vc-trans>;
putting_up_with:
(<vc-trans> & (<verb-ge> or <verb-pg>)) or <verb-ge-d>;

<vc-take-it>: {[@MV+]} & TH+;
take_it make_out point_out: <verb-pl,i> & <vc-take-it>;
takes_it makes_out points_out: <verb-s> & <vc-take-it>;
 made_out pointed_out: 
(<verb-sp,pp> & <vc-take-it>) or <verb-pv> or <verb-po>;
took_it: <verb-sp> & <vc-take-it>;
taken_it: <verb-pp> & <vc-take-it>;
taking_it making_out pointing_out: (<vc-take-it> & <verb-pg,ge>) or
<verb-ge-d>;

<vc-turn-out>: {[@MV+]} & THi+;
turn_out: <verb-s-pl,i> & <vc-turn-out>;
turns_out: <verb-s-s> & <vc-turn-out>;
turned_out: <verb-s-sp,pp> & <vc-turn-out>;
turning_out: <verb-s-pg> & <vc-turn-out>;

<vc-find-out>: {[@MV+]} & (TH+ or QI+);
find_out figure_out: <verb-pl,i> & <vc-find-out>;
finds_out figures_out: <verb-s> & <vc-find-out>;
found_out figured_out: (<verb-sp,pp> & <vc-find-out>) or <verb-pv> or 
<verb-po>;
finding_out figuring_out: (<vc-find-out> & <verb-pg,ge>) or
<verb-ge-d>; 

<vc-keep-on>: {Pg+ or @MV+};
keep_on give_up: <verb-s-pl,i> & <vc-keep-on>;
keeps_on gives_up: <verb-s-s> & <vc-keep-on>;
kept_on: <verb-s-sp,pp> & <vc-keep-on>;
gave_up: <verb-s-sp> & <vc-keep-on>;
given_up: <verb-s-pp> & <vc-keep-on>;
keeping_on giving_up: (<vc-keep-on> & <verb-pg,ge>) or <verb-ge-d>;

<vc-end-up>: Pg+ or Pa+ or ({AF-} & {@MV+});
end_up: <verb-s-pl,i> & <vc-end-up>;
ends_up: <verb-s-s> & <vc-end-up>;
ended_up: <verb-s-sp,pp> & <vc-end-up>;
ending_up: (<vc-end-up> & <verb-pg,ge>) or <verb-ge-d>;

words/words.v.1.p: <verb-pv>;

<vc-paraph>: 
{@MV+} & (((Xd- or Xq-) & Xc+ & (COq+ or CP- or Eq+)) or [Xc+ & Ce+]);
words/words.v.10.1: [[{@E-} & (Sp- or I- or SIpj+) & <vc-paraph>]];
words/words.v.10.2: [[{@E-} & (Ss- or SIsj+) & <vc-paraph>]];
words/words.v.10.3: {@E-} & (S- or PP- or SI*j+) & <vc-paraph>;
read.q: {@E-} & (S- or I- or SI*j+) & <vc-paraph>;
wrote.q: {@E-} & (S- or SI*j+) & <vc-paraph>;
written.q: {@E-} & PP- & <vc-paraph>;
words/words.v.10.4: [[{@E-} & Pg- & <vc-paraph>]];

<vc-it-paraph>: {@MV+} & Xd- & Xc+ & (COqi+ or CPi- or Eqi+);
seem.i appear.i: [[{@E-} & (SFp- or If-) & <vc-it-paraph>]];
seems.i appears.i: [[{@E-} & SFs- & <vc-it-paraph>]];
seemed.i appeared.i: {@E-} & (SF- or PPf-) & <vc-it-paraph>;
seeming.i appearing.i: [[{@E-} & Pgf- & <vc-it-paraph>]];

say.q: {@E-} & (Sp- or I- or SIpj+) & <vc-paraph>;
says.q: {@E-} & (Ss- or SIsj+) & <vc-paraph>;
said.q: {@E-} & (S- or PP- or SI*j+) & <vc-paraph>;
saying.q: {@E-} & Pg- & <vc-paraph>;

%PREPOSITIONS

<prep-main-a>: Mp- or MVp- or [({Xc+ & {Xd-}} & CO+)] or Pp- or
(Xd- & Xc+ & (MX- or MVx-)) or (Cs+ & (Mj- or (Xd- & Xc+ & MX*j-)))
or (Wj- & Qd+) or [Wq- & PF+];
<prep-main-b>: Mp- or Pp- or MVp- or [({Xc+ & {Xd-}} & CO+)] or 
(Xd- & Xc+ & (MX- or MVx-));

behind.p beneath under:
({Yd-} & {JQ+} & J+ & (<prep-main-a> or FM-)) or (MVp- & B-);
below above: ({Yd-} & {{JQ+} & J+} & (<prep-main-a> or FM-)) or (MVp- & B-);
within: ({JQ+} & J+ & <prep-main-a>) or (MVp- & B-);
during: ({JQ+} & J+ & (<prep-main-a> or UN-)) or (MVp- & B-);
from:
({Yd-} & {JQ+} & (FM+ or J+ or Mg+) & <prep-main-a>)
or (MVp- & B-) or (NIa+ & NIb+ & NIc+);
at toward towards without upon:
({JQ+} & (J+ or Mg+) & <prep-main-a>) or (MVp- & B-);
except: ({JQ+} & (J+ or Mg+) & <prep-main-a>) or (MVp- & B-) or 
((MVp+ or TO+) & <prep-main-a>); % no Pp?
against beyond beside: 
({JQ+} & (J+ or Mg+) & <prep-main-a>) or (MVp- & B-);
between:
({JQ+} & (J+ or Mg+) & <prep-main-a>) or (MVp- & B-) or (NIa+ & NId+ & NIc+);
with: ({JQ+} & (J+ or Mg+) & <prep-main-a>)
or (J+ & {EBm+} & (M+ or [[O*n+]]) & ([({Xc+ & {Xd-}} & CO+)] or 
MVp- or (Xd- & Xc+ & (MX- or MVx-)))) 
or (MVp- & B-);
among:
({JQ+} & (J+ or Mg+) & (<prep-main-a> or FM-)) or (MVp- & B-);
for.p: ({JQ+} & (J+ or Mg+ or TI+) & 
<prep-main-a>) or ((O+ or OX+) & FR+) or (MVp- & B-) or (MG- & JG+) or 
(MVp- & FL+);

into: ({JQ+} & (J+ or Mg+ or QI+) & <prep-main-a>) or (MVp- & B-);
about: ({JQ+} & (J+ or Mg+ or QI+) & <prep-main-a>) or EN+ or EZ+ or 
(MVp- & B-)
or (TOf+ & (Mp- or MVp- or Pp-)); % no MVp-?

off across along: 
({JQ+} & (J+ or Mg+) & (<prep-main-a> or FM-)) or K- or (MVp- & B-);
through past.p:
({JQ+} & J+ & (<prep-main-a> or FM-)) or K- or (MVp- & B-);
around:
({JQ+} & (J+ or Mg+) & (<prep-main-a> or FM-)) or K- or (MVp- & B-)
or [EN+];
out up down.e:
({JQ+} & ([J+] or [[MVp+]]) & (<prep-main-a> or FM-)) or K- or (MVp- & B-);
by: ({JQ+} & (J+ or Mg+ or JT+) & (<prep-main-a> or FM-)) or K- or
 (MVp- & B-);
in: ({JQ+} & (J+ or Mg+ or IN+) & (<prep-main-a> or FM-)) 
or K- or (MVp- & B-) or JQ+ or (MG- & JG+);

on: ({JQ+} & (J+ or Mg+ or ON+ or [QI+]) & <prep-main-a>) or K- or 
(MVp- & B-);
over: ({JQ+} & (J+ or Mg+ or QI+ or [[MVp+]]) & (<prep-main-a> or FM-)) or
K- or EN+ or EZ+ or (MVp- & B-);
like.p: ((J+ or Mg+) & <prep-main-b>)
or (LJ- & Mg+) or (LI- & (J+ or Cs+)) or (MVp- & B-);
as_if: (LI- & Cs+);
unlike: J+ & (MVp- or Pp- or [({Xc+ & {Xd-}} & CO+)] or (Xd- & Xc+ & E+));
of: ({JQ+} & (J+ or Mg+ or QI+) & (Mp- or OF- or (Xd- & Xc+ & MX-) 
or (Cs+ & (Mj- or (Xd- & Xc+ & MX*j-))) or [({Xc+ & {Xd-}} & CO+)]))
or ((OF- or Mp-) & B-) or (MG- & JG+) or (NF- & NJ+) or (Mp- & TI+); 

to: ({@E-} & {NT-} & I+ & (TO- or [{Xd- & Xc+} & MVi-] 
or [[R-]] or (SFsx+ & <S-CLAUSE>) or (Xc+ & {Xd-} & CO+)))
or I*a+ or ({JQ+} & (J+ or Mg+) & <prep-main-a>) 
or [MVp- & B-] or NIb-;
so_as_to: I+ & {Xd- & Xc+} & MVi-; 

besides: {J+ or Mg+} & ([({Xc+ & {Xd-}} & CO+)] or MVp- or [Wq- & PF+]);
throughout: {J+} & ([({Xc+ & {Xd-}} & CO+)] or MVp- or [Wq- & PF+]);

inside.e outside.e underneath alongside:
{J+} & (<prep-main-b> or FM-);
amid plus.p minus.p via onto: 
J+ & (<prep-main-b> or [Wq- & PF+]);
versus: (J+ & Mp-) or (G- & G+);
vs: G- & G+;

worth.p: (Mp- & (J+ or OF+)) or (Paf- & Mg+) or (Pa- & J+);
opposite.p: J+ & <prep-main-b>;
better_off worse_off: {EC-} & Pa- & {Pg+};

off_of out_of:  ({JQ+} & J+ & <prep-main-b>) or (MVp- & B-);

despite notwithstanding 
other_than apart_from aside_from: (J+ or Mg+) & (MVp- or (Xd- & Xc+ & 
(MVx- or E+)) or
[({Xc+ & {Xd-}} & CO+)]); 
rather_than: (J+ or Mg+ or Mp+ or I+) & 
((Xd- & Xc+ & (E+ or MVx-)) or MVp- or [({Xc+ & {Xd-}} & CO+)]); 
instead_of because_of prior_to: 
(J+ or Mg+) & (MVp- or Pp- or [({Xc+ & {Xd-}} & CO+)] or (Xd- & Xc+ & 
(E+ or MVx-)));
as_well_as: (J+ or Mg+) & (MG- or Mp- or MVp- or [({Xc+ & {Xd-}} & CO+)] or
(Xd- & Xc+ & (MX- or MVx-)));
according_to as_of in_case_of in_response_to unbeknownst_to thanks_to:
J+ & (MVp- or Pp- or [({Xc+ & {Xd-}} & CO+)] or (Xd- & Xc+ & (E+ or MVx-)));
due_to along_with en_route_to in_connection_with: J+ & <prep-main-b>;
regardless_of as_to: (J+ or QI+) & (MVp- or [({Xc+ & {Xd-}} & CO+)] or 
(Xd- & Xc+ & (E+ or MVx-)));

overhead.e midway in_public in_private
en_route a_la_mode a_la_carte: <prep-main-b>;
abroad upstairs.e downstairs.e overseas.e: 
<prep-main-b> or FM-;
elsewhere: <prep-main-b> or FM- or [[J-]];
ahead at_hand in_store in_reverse in_place in_town 
under_way in_office out_of_office out_of_reach
in_reach within_reach on_guard at_large in_hand on_hand for_free
on_file in_line on_line in_loco_parentis on_board en_route in_bed 
out_of_bed on_strike on_top from_afar at_stake in_question
at_issue on_lease on_trial in_league in_cahoots
on_break on_camera in_command in_concert by_association in_association
on_deck on_disk on_file on_foot on_location in_phase: 
MVp- or Mp- or Pp- or (Xc+ & Xd- & (MX- or MVx-)); 
uptown downtown.e underground.e out_of_town: 
MVp- or Mp- or Pp- or FM- or (Xc+ & Xd- & MVx-);

forward.e backward forwards.e backwards sideways ashore abreast aft 
half-way two-fold downhill southward underfoot westward eastward northward 
overnight.e 
on_hold on_track in_loco_parentis in_situ in_toto in_check off_balance
in_check on_course at_end by_example on_holiday by_invitation
on_patrol on_stage in_step in_tempo on_schedule behind_schedule
ahead_of_schedule for_good for_keeps: 
MVp- or Pp- or (Xc+ & Xd- & MVx-);

everywhere anywhere indoors outdoors nowhere upstream downstream underwater.e:
MVp- or Pp- or FM- or (Xc+ & Xd- & MVx-); % Everywhere I look. Also, Mp here?

somewhere: MVp- or Pp- or [({Xc+ & {Xd-}} & CO+)] or (Xc+ & Xd- & MVx-);

as_usual to_date on_average
in_turn so_far in_particular in_response in_general thus_far: MVp- or Mp- or 
({Xc+ & {Xd-}} & CO+) or (Xc+ & Xd- & (MVx- or MX-)); 

later earlier: ({ECa- or Yt-} & (E+ or Mp- or Pp- or MVb- 
or [({Xc+ & {Xd-}} & CO+)] or (Xd- & Xc+ & (MX- or MVx-))
or ({[[@Ec-]]} & {Xc+} & A+))) or (Yt- & (Ca+ or Qe+));

away: ({Yd-} & (MVp- or Pp- or ({Xc+ & {Xd-}} & CO+))) or K-;
aboard: ((MVp- or Mp- or Pp-) & {J+}) or K-;
apart home.i: K-;
back.k: K- or (MVp+ & (MVp- or FM-));
forth aside.p: K- or MVa-;

nearby: A+ or MVp- or Pp- or FM-;
next_to in_back_of in_front_of close_to ahead_of by_way_of
on_top_of akin_to atop betwixt vis-a-vis in_lieu_of on_account_of
in_place_of:
J+ & (<prep-main-b> or FM- or [Wq- & PF+]);
near.p: {EE- or EF+} & J+ & (<prep-main-b> or FM- or [Wq- & PF+]);
all_over: {J+} & (Pp- or MVp- or [({Xc+ & {Xd-}} & CO+)] or FM-);
% or JQ+?!
per: Us+ & Mp-;
such_as: J+ & (MVa- or Mp- or (Xc+ & Xd- & (MVx- or MX-)));

here: J- or <prep-main-b> or [Wq- & PF+];

there: J- or <prep-main-b> or 
((SFst+ or SFp+) & <CLAUSE>) or SFIst- or SFIp- or OXt-;

de du des del von: {G-} & G+;
y: G- & G+;

% TIME AND PLACE EXPRESSIONS 

one_day one_morning one_afternoon
one_evening one_night this_time that_time these_days:
<prep-main-b> or [[E+]];

day.t week.t month.t year.t weekend.t morning.t afternoon.t evening.t
night.t:
((DTn- or DTi-) & (<prep-main-b> or [[E+]])) or 
(DTi- & (JT- or [[<noun-main-s>]] or YS+));
the_next the_previous the_following: DTn+;

all_day all_night all_week all_morning all_afternoon all_year
at_night last_time next_time: % all the time?
<prep-main-b> or JT- or YS+
 or [[<noun-main-s>]];

today tonight: <prep-main-b> or JT- or [[E+]]
 or YS+ or [[<noun-main-s>]];
yesterday: {TD+} & (<prep-main-b> or JT- or [[E+]]
 or YS+ or [[<noun-main-s>]]);
tomorrow: {TD+} & (<prep-main-b> or JT- or YS+ or [[<noun-main-s>]]);
Monday Tuesday Wednesday Thursday Friday Saturday Sunday:
(DTn- or DTi- or [()]) & {TD+} & (YS+ or <prep-main-b> or JT- or ON- 
or [[<noun-main-s>]]);

morning.i afternoon.i night.i evening.i: TD-;
January February March April May.i June July August September October
November December: 
((DTn- or DTi- or ({TA-} & {TY+})) & (JT- or IN- or [[<noun-main-s>]] or YS+))
 or ((DTn- or DTi-) & <prep-main-b>) or
(TM+ & {TY+} & (ON- or JT- or [[<noun-main-s> or MVp- or Mp- or AN+]])) 
or AN+;
Jan.x Feb.x Aug.x Sept.x Oct.x Nov.x Dec.x Jan..x Feb..x Aug..x Sept..x
Oct..x Nov..x Dec..x:
TM+ & {TY+} & (ON- or JT- or [[<noun-main-s>
or MVp- or Mp- or AN+]]);

fall.i spring.i winter.i summer.i: 
((DTn- or DTi-) & <prep-main-b>)
or (DTi- & (JT- or YS+ or [[<noun-main-s>]]));

weeks.p days.p hours.p minutes.p seconds.p months.p years.p decades.p
centuries.p:
({ND- or [[EN-]]} & (Yt+ or OT- or EC+)) or (ND- & Ye-) or (TQ- & BT+);
week.y day.y hour.y minute.y second.y month.y year.y decade.y century.y:
NS- & (({NJ-} & {EN-} & (Yt+ or OT- or EC+)) or (EN- & J-)); 
a_week a_day an_hour a_minute a_second a_month a_year a_decade a_century:
(Yx- & <prep-main-b>);
a_while: J- or Yt+ or OT- or EC+;
now.i then.i: JT- or FM-;
a_long_time some_time: Yt+;
feet.p miles.p yards.p inches.p meters.p blocks.p light-years.p:
(ND- or [()] or [[EN-]]) & (Yd+ or EC+ or [[MVp-]] or Ya+ or OD-);
foot.p mile.p yard.p inch.p block.p light-year.p:
NS- & {NJ-} & {EN-} & (Yd+ or EC+ or [[MVp-]] or Ya+ or OD-);
point.p percentage_point:
NS- & {NJ-} & (Yd+ or OD-);
points.p percentage_points: ND- & (Yd+ or MVp-);
ago: Yt- & (<prep-main-b> or Ca+ or Qe+ or JT-);
every.i: {EN-} & Ye+ & <prep-main-b>;
times.i: (ND- & (({Xc+ & {Xd-}} & CO+) or MVp- or EC+ or EZ+
or Ca+ or Qe+ or Yx+)) or (({ND-} & DG-) & {Cs+} & 
(({Xc+ & {Xd-}} & CO+) or MVp- or (Xd- & Xc+ & MVx-)));
time.i: DG- & {Cs+} & (({Xc+ & {Xd-}} & CO+) or MVp-
or (Xd- & Xc+ & MVx-)); % NR-? 
the_day the_minute the_week
the_second the_month: (Cs+ & (({Xc+ & {Xd-}} & CO+) or MVp-
or (Xd- & Xc+ & MVx-))) or Yt+;
the_year: (Cs+ & (({Xc+ & {Xd-}} & CO+) or MVp- or (Xd- & Xc+ & MVx-)))
 or Yt+ or (TY+ & <noun-main-s>);
every_time: {EN-} & (Cs+ & (({Xc+ & {Xd-}} & CO+) or MVp- or 
(Xd- & Xc+ & MVx-)));
dollars.i cents.i:  ND- & (EC+ or Yd+ or OD-);
1_dollar one_dollar a_dollar 1_cent 
one_cent a_cent: {NJ-} & (EC+ or Yd+ or OD-);
dollar.i cent.i: ((ND- or NS-) & AN+) or (NS- & {NJ-} & (EC+ or Yd+ or OD-));
twofold threefold fourfold fivefold sixfold sevenfold eightfold ninefold
tenfold a_hundredfold a_thousandfold: MVp- or A+;
degrees_Fahrenheit degrees_Centigrade: ND- & <noun-main-s>;

%QUESTION WORDS & CONJUNCTIONS

who: (R- & (({MVp+ or MVx+} & RS+) or Cr+)) 
or ({EL+} & (S**w+ or B*w+) & (Ws- or Wq- or QI*d- or BIqd- or
 (Xd- & Xc+ & MX*r-))); 

what: ({EL+} & (D**w+ or Ss*w+ or Bsw+ or BW+) & (Wq- or Ws- or QI*d-
or BIqd-))
or ((Ss*d+ or Bsd+ or BW+) 
& (J- or O- or (Ss*t+ & <CLAUSE>) or SIs*t-)) or (D+ & JQ-);

which: ((Jr- or R-) & (({MVp+ or MVx+} & RS+) or Cr+)) or 
((D**w+ or ({OF+} & (S**w+ or B*w+))) & (Wq- or Ws- or QI*d- or BIqd-))
 or Jw- or (JQ- & D+) or ((S**w+ or B*w+) & (Xc+ & Xd- & MX*r-));
% To prevent "The dog at which owner I yelled was black": Give "which
% JWx; make equivalent to JW in p.p. except make it incompat with Mj.
% (Also: Mj must be made "include in domain" link.)

whom: (R- & Cr+) or (B*w+ & (Wq- or QI*d- or BIqd- or (Xc+ & Xd- & MX*r-)))
 or (Jr- & (RS+ or Cr+)) or Jw-;

whose: (D**w+ & (Mr- or Wq- or Ws- or QI*d- or BIqd- or (Xc+ & Xd- & MX*r-))) 
or (JQ- & D+) or (U+ & Jr- & (RS+ or Cr+));

whoever: {EL+} & (Ss*d+ or Bsd+) & 
(<noun-main-s> or (Xc+ & {Xd-} & CO+) or ({Xd- & Xc+} & MVs-));
whatever: ({EL+} & (Ss*d+ or Bsd+ or BW+ or D**w+) & 
(<noun-main-s> or (Xc+ & {Xd-} & CO+) or ({Xd- & Xc+} & MVs-)))
or ((ALx+ & J+) & (({Xd-} & Xc+ & CO+) or ({Xd- & Xc+} & MVs-)));

whenever wherever: {EL+} & (Cs+ & (({Xc+ & {Xd-}} & CO+) or 
({Xd- & Xc+} & MVs-)));
no_matter: QI+ & ((Xc+ & {Xd-} & CO+) or ({Xd- & Xc+} & MVs-));

that: (Ce+ &  
([SFsx+ & <S-CLAUSE>] or TH- or [[MVh-]])) or (TS- & SI*j+ & I*j+)
or [{AL-} & D*u+] or (R- & (({MVp+ or MVx+} & RS+) or Cr+)) or 
({[[M+]]} & <noun-main-h>) or EE+ or (EA+ & {HA+}) or DTn+;

because: ((Cs+ & {Xc+ & {Xd-}} & CO+) or (Cs+ & (BIh- or 
({Xd- & Xc+} & MVs-))));
now_that just_as if_only in_case whereby whereupon insofar_as inasmuch_as 
ere on_the_grounds_that on_grounds_that in_that on_condition_that: 
Cs+ & (({Xc+ & {Xd-}} & CO+) or ({Xd- & Xc+} & MVs-));
unless though.c even_though: (Cs+ or Mg+ or Mv+) & (({Xc+ & {Xd-}} & CO+) or 
({Xd- & Xc+} & MVs-) or (Xd- & Xc+ & E+));
as_if as_though: ((Cs+ or Mg+ or Mv+) & (({Xc+ & {Xd-}} & CO+) or 
({Xd- & Xc+} & MVs-) or 
(Xd- & Xc+ & E+))) or (LI- & Cs+);
as_soon_as: Cs+ & {Xc+ & {Xd-}} & CO+;
until: (Cs+ or Mg+ or J+ or JT+ or UN+) & (({Xc+ & {Xd-}} & CO+) or 
({Xd- & Xc+} & MVs-) or [Mp-]);
since: ((Cs+ or Mg+ or J+ or JT+ or UN+) & (({Xc+ & {Xd-}} & CO+) or 
({Xd- & Xc+} & MVs-) or [Mp-])) or [[MVa-]] or [[E+]];
ever_since: (J+ or Mg+ or Cs+) & (({Xc+ & {Xd-}} & CO+) or ({Xd- & Xc+} &
 MVs-));
after: {EI- or Yt-} & (Cs+ or Mg+ or J+ or JT+) & (<prep-main-b>
or UN- or Ca+ or Qe+);
before: ({EI- or Yt-} & {Cs+ or Mg+ or J+ or JT+} & (<prep-main-b>
or UN-)) or (Yt- & (Ca+ or Qe+));
if: (Cs+ & {Xc+ & {Xd-}} & (Wd- & (Qd+ or Ws+ or Wq+)))
 or ((Cs+ or [Mg+] or [Mv+]) & (({Xd- & Xc+} & MVs-) or 
({Xc+ or {Xd-}} & CO+))) or (QI- & Cs+);
although: (Cs+ & {Xc+ & {Xd-}} & CO+) or ({Xd-} & CC- & Wd+);
while: ((Cs+ or Mg+ or Mp+) & (({Xc+ & {Xd-}} & CO+) or ({Xd- & Xc+} & MVs-) 
or (Xd- & Xc+ & E+)));
once: ({Cs+ or Mp+} & (({Xc+ & {Xd-}} & CO+) or ({Xd- & Xc+} & MVs-) or 
(Xd- & Xc+ & E+))) or E+ or EB- or Yx+;
or: XXX+;
but: (({Xd-} & CC-) or Wc-) & (Wd+ or Qd+ or Ws+ or Wq+);
and: ((({Xd-} & CC-) or Wc-) & (Wd+ or Qd+ or Ws+ or Wq+)) or NId-;
either:  BOGUS+ or (Ds+ or E+ or ({OF+} & <noun-main-x>)) or ({Xd+ & Xc-} 
& MVa-);
neither: BOGUS+ or Ds+ or E+ or ({OF+} & <noun-main-x>);
nor: BOGUS+;
for.c: [[(({Xd-} & CC-) or Wc-) & (Wd+ or Qd+ or Ws+ or Wq+)]];
yet.c: ((({Xd-} & CC-) or Wc-) & Wd+) or E+ or MVa- or ({Xd-} & Xc+ & CO+);
thus therefore: ({Xc+ & {Xd-}} & CO+) or ({Xd-} & CC- & Wd+) or E+;
when: (WN- & Cs+) or ((PF+ or TOn+ or Cs+) & (BIq- or 
QI- or (SFsx+ & <S-CLAUSE>))) or (Wq- & (Q+ or PF+)) or 
((Cs+ or Mp+ or Mg+ or Mv+) & (({Xd- & Xc+} & MVs-) or ({Xc+ & {Xd-}} & CO+) 
or (Xd- & Xc+ & E+)));
why: {EL+} & ((Wq- & Q+) or (QI- & (Cs+ or TOn+)) or (Cs+ & 
((SFsx+ & <S-CLAUSE>) or WY- or BIq-)));

where: {EL+} & ((Wq- & (WR+ or Q+ or PF+)) or 
((WR+ or Cs+ or TOn+ or PF+) & (BIq- or QI- or (SFsx+ & <S-CLAUSE>)))
 or ((Cs+ or PF+ or WR+) & <prep-main-b>));
whether: ((QI- or BIq-) & (Cs+ or TOn+)) or (Cs+ & SFsx+ & <S-CLAUSE>);
whether_or_not: ((QI- or BIq-) & (Cs+ or TOn+)) or 
(Cs+ & (({Xd- & Xc+} & MVs-) or ({Xc+ & {Xd-}} & CO+)));
 
how: 
((((EAh+ or EEh+) & {HA+}) or H+ or AFh+) & 
(BIqd- or QI*d- or Wq- or Ws-)) or
(Wq- & (Q+ or AF+)) or 
((Cs+ or TOn+) & (QI- or BIq- or (SFsx+ & <S-CLAUSE>)));

not: EB- or ({@E-} & N-) or NT+ or [[((Ma+ or Mg+ or Mv+ or Mp+) & CO+)
or (Mgn- & Mg+) or (Mvn- & Mv+) or (Mpn- & Mp+) or (Man- & Ma+) or
 (I- & I+)]];

%ADJECTIVES

<adj-op>: [[{@E-} & Wq- & {@MV+} & PF+ & {@MV+} & {CC+}]] or 
({@E-} & {@MV+} & ([[{Xd-} & Xc+ & COp+]] or (Xd- & Xc+ & MX*a-))); 

words/words.adj.1:  % angry fast
   {EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or Ma-)
 & {@MV+}) or AA+ or [[DD- & <noun-main-p>]] or <adj-op>);

responsible.a accountable.a:
 {EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or Ma- 
or Vh-) & {@MV+}) or AA+ or [[DD- & <noun-main-p>]] or <adj-op>);

long.a: ({EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or 
Ma-) & {@MV+}) or AA+ or [[DD- & <noun-main-p>]] or <adj-op>)) 
or ((Ya- or Yt-) & (Pa- or Ma-)) or (H- & (BT+ or Yt+));

wide.a tall.a:  ({EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or 
AF+ or Ma-) & {@MV+}) or AA+ 
or [[DD- & <noun-main-p>]] or <adj-op>)) or (Ya- & (Pa- or Ma-));
old.a: ({EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or 
AF+ or Ma-) & {@MV+}) or AA+ 
or [[DD- & <noun-main-p>]] or <adj-op>)) or (Ytm- & (Pa- or Ma-));
aged.i: NIa+ & (Pa- or Max- or <adj-op>);

easy hard.a simple difficult fun.a expensive: {EA- or EF+}
& (({[[@Ec-]]} & {Xc+} & A+) or ((Paf- or AF+ or Ma-) & {@MV+} &
{((TOt+ & B+) or TOi+) & {LE+}}) or AA+ or [[DD- & <noun-main-p>]]
or ((TOt+ & B+) & <adj-op>));
ready: {EA- or EF+}
& (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or Ma-) & {@MV+} & 
{((TOt+ & B+) or TO+) & {LE+}}) or AA+ or [[DD- & <noun-main-p>]]
or ((TO+ or (TOt+ & B+)) & <adj-op>));
silly nasty pleasant unpleasant dangerous cruel standard.a safe.a
legal illegal:
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Paf- or AF+ or Ma-) & 
{@MV+} & {((TOt+ & B+) or TOi+) & {LE+}}) or AA+ or [[DD- & <noun-main-p>]]
or ((TOt+ & B+) & <adj-op>));
good bad unusual great useful a_bitch nice
strange wonderful terrible possible impossible annoying.a typical 
fair.a unfair tough.a:
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Paf- or AF+ or Ma-) & {@MV+}
& {((TOt+ & B+) or THi+ or TOi+) & {LE+}}) or AA+ or [[DD- & <noun-main-p>]]
or ((TOt+ & B+) & <adj-op>));
important essential crucial necessary imperative vital: 
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Paf- or AF+ or Ma-) &  
(({@MV+} & {(THi+ or TOi+ or TSi+) & {LE+}}) or (TOt+ & B+))) or AA+ or
[[DD- & <noun-main-p>]] or ((TOt+ & B+) & <adj-op>));
common practical original.a normal helpful striking.a
confusing.a frustrating.a disturbing.a
logical illogical elegant efficient awful
absurd natural.a alarming.a acceptable unacceptable deplorable
detestable scary shocking.a:
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Paf- or AF+ or Ma-) & {@MV+}
& {(THi+ or TOi+) & {LE+}}) or AA+ or [[DD- & <noun-main-p>]] or <adj-op>);
surprising.a interesting.a odd remarkable amazing.a exciting.a depressing.a 
rare.a embarrassing.a: 
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Paf- or AF+ or Ma-) & 
{@MV+} & {(THi+ or Ci+ or TOi+) & {LE+}}) or AA+ or 
[[DD- & <noun-main-p>]] or <adj-op>);
crazy sane insane stupid ridiculous wrong.a curious:
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Paf- or AF+ or Ma-) & 
{@MV+} & {(TO+ or TOi+ or THi+) & {LE+}}) or AA+ or [[DD- & <noun-main-p>]]
 or ({TO+} & <adj-op>));
wise unwise smart.a intelligent: {EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) 
or ((Paf- or AF+ or 
Ma-) & {@MV+} & {(TO+ or TOi+) & {LE+}}) or AA+ or [[DD- & <noun-main-p>]]
or ({TO+} & <adj-op>));
unlikely:
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Paf- or AF+ or Ma-) 
& {@MV+} & {(TOf+ or THi+ or Ci+) & {LE+}}) or AA+ or [[DD- & <noun-main-p>]]
or ({TO+} & <adj-op>));
likely:
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Paf- or AF+ or Ma-) 
& {@MV+} & {(TOf+ or THi+ or Ci+) & {LE+}}) or AA+ or [[DD- & <noun-main-p>]]
or (TO+ & <adj-op>) or [E+]);
true apparent false official.a strict significant funny notable.a untrue 
tragic
plain.a urgent a_drag a_bummer definite evident impressive incredible
inevitable mysterious pathetic probable admirable commendable conceivable
insignificant miraculous self-evident undeniable plausible understandable
demonstrable hilarious improbable inexcusable outrageous paradoxical shameful
inconceivable unbelievable astonishing.a disgraceful debatable arguable
lamentable regrettable:
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or
((Paf- or AF+ or Ma-) & {@MV+} & {(THi+ or Ci+) & {LE+}}) or AA+ or 
[[DD- & <noun-main-p>]]);
clear.a unclear relevant irrelevant obvious immaterial: {EA- or EF+} & 
(({[[@Ec-]]} & {Xc+} & A+) or
((Paf- or AF+ or Ma-) & {@MV+} & {(THi+ or QIi+) & {LE+}}) or 
AA+ or [[DD- & <noun-main-p>]]);
clear.i: {EA- or EF+} & MI- & TH+;
sure.i certain.i: {EA- or EF+} & MI- & (TH+ or (OF+ & {@MV+}));
tactful conventional advisable prudent sensible tactless polite
impolite arrogant conceited obnoxious valuable reasonable
unreasonable traditional unnecessary tempting.a usual
inadvisable lovely a_mistake ethical unethical immoral childish awkward
appropriate.a costly customary desirable dumb effective.a fashionable 
foolish healthy hip.a okay.a OK ok
painful selfish sufficient advantageous boring.a
inappropriate insufficient irrational irresponsible mandatory meaningless
preferable senseless trivial wrongheaded premature risky dishonest
hypocritical enjoyable idiotic inconvenient unkind pointless:
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or
((Paf- or AF+ or Ma-) & {@MV+} & {TOi+ & {LE+}}) or AA+ or 
[[DD- & <noun-main-p>]]);
glad fortunate unfortunate lucky unlucky happy sad surprised.a
delighted.a overjoyed:
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or Ma-) & 
{@MV+} & {(Ce+ or TO+ or TH+) & {LE+}}) or AA+ or [[DD- & <noun-main-p>]] 
or ({Ce+ or TO+ or TH+} & <adj-op>));
certain.a: {EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or 
((Paf- or AF+ or Ma-) &
{@MV+} & {(Ce+ or TOf+ or TH+ or QI+ or (OF+ & {@MV+})) & {LE+}}) or AA+ or 
[[DD- & <noun-main-p>]] or ({Ce+ or TO+ or TH+ or QI+ or OF+} & <adj-op>));
unknown questionable: 
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Paf- or AF+ or Ma-) 
& {@MV+} & {QIi+}) or AA+ or [[DD- & <noun-main-p>]] or <adj-op>);
sure.a unsure uncertain careful: {EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) 
or ((Pa- or AF+ or Ma- 
) & {@MV+} & {(Ce+ or TO+ or TH+ or QI+ or (OF+ & {@MV+})) & {LE+}}) or AA+
or [[DD- & <noun-main-p>]] or ({Ce+ or TO+ or TH+ or QI+ or OF+} & <adj-op>));
correct.a incorrect right.a excited.a 
disappointed.a upset.a sorry content.a ashamed
amused.a amazed.a astonished.a astounded.a pleased.a
disgusted.a distressed.a dismayed.a irritated.a embarrassed.a alarmed.a:
 {EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or Ma-) & 
{@MV+} & {(TO+ or TH+) & {LE+}}) or AA+ or [[DD- & <noun-main-p>]]
or ({TO+ or TH+} & <adj-op>));
proud scared.a unafraid unashamed:  
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or Ma-) & 
{@MV+} & {(TO+ or TH+ or (OF+ & {@MV+})) & {LE+}}) or AA+ or [[DD- & 
<noun-main-p>]] or ({TO+ or TH+ or OF+} & <adj-op>));
tired.a full sick.a critical.a
capable contemptuous incapable reminiscent scornful mindful short.a
appreciative complimentary born.a worthy free.a terrified.a unworthy: 
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or 
((Pa- or AF+ or Ma-) & {@MV+} & {OF+ & {@MV+}}) or AA+ or 
[[DD- & <noun-main-p>]]);
fond: {EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or 
((Pa- or AF+ or Ma-) & OF+ & {@MV+}) or (OF+ & <adj-op>));
afraid: {EA- or EF+} & (((Pa- or AF+ or Ma-) & 
{@MV+} & {((OF+ & {@MV+}) or Ce+ or TH+ or TO+) & {LE+}}) or 
({OF+ or Ce+ or TH+ or TO+} & <adj-op>));
apprehensive secure.a optimistic pessimistic annoyed.a confused.a offended.a
insulted.a concerned.a depressed.a doubtful 
grateful mad mistaken.a hopeful.a: 
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or Ma-) 
& {@MV+} & {TH+ & {LE+}}) or AA+ or [[DD- & <noun-main-p>]] or ({TH+} & 
<adj-op>));
aware unaware: 
{EA- or EF+} & (((Pa- or AF+ or Ma-) & {@MV+} & {(TH+ or (OF+ & {@MV+})) &
{LE+}}) or ({TH+ or OF+} & <adj-op>) or [[DD- & <noun-main-p>]]);
conscious confident skeptical jealous suspicious envious desirous
convinced.a unconvinced.a:
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or Ma-) 
& {@MV+} & {(TH+ or (OF+ & {@MV+})) & {LE+}}) or AA+ or 
[[DD- & <noun-main-p>]] or ({TH+ or OF+} & <adj-op>));
eager reluctant able unable impatient eligible brave.a anxious apt.a desperate
keen prepared.a willing.a hesitant:
{EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or Ma-) & 
{@MV+} & {TO+ & {LE+}}) or AA+ or [[DD- & <noun-main-p>]] or 
({TO+} & <adj-op>));
former: A+ or G+ or (DG- & <noun-main-x>);
latter: DG- & <noun-main-x>;
overall.a onetime outboard pinstripe goddam de_facto de_jure: A+;
pro_forma ad_hoc bona_fide: A+ or Pa-;
a_priori a_posteriori: A+ or MVa- or ({Xc+ & {Xd-}} & CO+);
asleep awake alike alive ablaze adrift afire aflame afloat afoot
aghast aglow agog ajar amiss askew astir awash awry de_rigeur
rife fraught: 
((Ma- or Pa-) & {@MV+}) or <adj-op>;
alone: ((Ma- or Pa-) & {@MV+}) or <adj-op> or MVp- or E+;

free.i straight.i loose.i: Vs- & {MV+};
outstanding.a available.a:
   {EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or Max-)
 & {@MV+}) or AA+ or [[DD- & <noun-main-p>]] or <adj-op>);
due.i effective.i: (TY+ or JT+) & <prep-main-b>;

north south east west northeast northwest southeast southwest: 
A+ or ({OF+} & (Pp- or MVp- or Mp- or (Xc+ & Xd- & (MVx- or MX-)))) 
or [[DD- & <noun-main-p>]];
northern southern eastern western.a northeastern northwestern southeastern 
southwestern: A+ or G+;

%ADVERBS

far_from: EA+;
a_bit a_little_bit: EA+ or EC+ or EE+ or ({Xd- & Xc+} & MVa-);
pretty.e very extremely very_very very_very_very exceptionally
notoriously unbelievably incurably extraordinarily
jolly.e mighty.e damn.e exceedingly overly downright plumb
vitally relatively abundantly chronically fabulously frightfully genuinely
humanly incomparably inherently marginally moderately patently
singularly supremely unbearably unmistakably unspeakably
awfully decidedly demonstrably fashionably frighteningly horrifyingly
indescribably intolerably laughably predominantly ridiculously unacceptably
unalterably unarguably undeniably undisputedly unimaginably unpardonably
unreasonably unusually hugely infernally:
EA+ or EE+;
quite: EA+ or EE+ or EZ+;
amazingly strangely incredibly: 
EA+ or EE+ or ({Xd- & Xc+} & Em+) or ({Xc+ & {Xd-}} & CO+) or EBm- or 
(Xd- & Xc+ & MVa-);
rather: EA+ or EE+ or Vw- or ({Xc+ & {Xd-}} & CO+);
particularly: EA+ or EE+ or Em+ or EB- or (MVl- & (MVp+ or MVa+ or MVs+));
notably: EB- or EA+ or EE+;
almost nearly: EA+ or EE+ or EN+ or EZ+ or Em+ or EBm-;
just_about: Em+ or EN+ or EZ+ or EA+;
entirely reasonably absolutely altogether highly equally fairly totally
completely terribly:
EA+ or EE+ or ({EE- or EF+} & (({Xd- & Xc+} & MVa-) or Em+ or Qe+ or Ca+)); 
really: EA+ or EE+ or Em+ or EBm-;
surprisingly: EA+ or EE+ or ({Xc+ & {Xd-}} & CO+) or ({Xd- & Xc+} & E+) or
(Xd- & Xc+ & MVa-); 
especially: EA+ or EE+ or EB- or Em+ or (MVl- & (MVp+ or MVa+ or MVs+));
virtually: EA+ or EE+ or EN+ or EZ+ or Em+;
wholly fully critically greatly grossly duly unduly: EA+ or
({EE- or EF+} & (({Xd- & Xc+} & MVa-) or Em+ or Qe+ or Ca+));
seemingly utterly: EA+ or Em+;
barely scarcely hardly merely truly practically: Em+ or EBm- or EA+;
partly largely mostly chiefly simply
purely solely: Em+ or EA+ or EB- or (MVl- & (MVp+ or MVa+ or MVs+));

words/words.adv.3: % chemically, etc.
({Xd- & Xc+} & E+) or EA+ or ({Xd- & Xc+} & MVa-) or EBm- or ({{Xd-} & Xc+} &
 CO+);

roughly approximately: ({EE- or EF+} & (EN+ or EZ+ or ({Xd- & Xc+} & MVa-)
 or E+));
in_part: EB- or (MVl- & (MVp+ or MVa+ or MVs+));

far.e: {EE- or EF+} & (({Xd- & Xc+} & MVa-) or Ca+ or Qe+ or Yd+);
okay.e barefoot.e willy-nilly quarterly.e madly outright
properly staccato.e legato.e all_the_way all_the_time
anymore aloud upwards downwards upward.e downward.e
inward outward inwards outwards anytime
wholesale.e anew forever awhile aback afoul afresh aloft amok amuck
apiece askance astern asunder inter_alia mutatis_mutandis par_excellence
upside-down.e ab_initio ad_infinitum ad_lib
ad_libitum ad_nauseum en_masse aground astray
to_market to_bid from_scratch to_office for_good into_account into_effect
at_once to_normal to_bed to_town into_office in_advance to_trial by_lot
in_stride by_credit_card by_ear by_foot in_kind en_masse to_mind in_mind
in_pencil in_pen to_scale: 
({Xd- & Xc+} & MVa-); 
hard.e: {EE- or EF+} & (({Xd- & Xc+} & MVa-) or Qe+ or Ca+);
poorly.e: {EE- or EF+} & (({Xd- & Xc+} & MVa-) or Qe+ or Ca+ or [[EA+]]);
early.e late.e: {EE- or EF+} & (({Xd- & Xc+} & MVa-) or TA+ or Qe+ or Ca+);
finely specially literally heavily alternately severely dearly
voluntarily dramatically flatly purposely jointly narrowly 
universally thickly widely: {EE- or EF+} & (({Xd- & Xc+} & MVa-) or Em+ or 
Qe+ or Ca+ or [[EA+]]);
respectively: ({Xd- & Xc+} & MVa-) or ({Xd- & Xc+} & E+);
long.e: E+ or ({EE- or EF+} & ({Xd- & Xc+} & MVa-)) or ({EE- or EF+} & FL-); 
daily.e weekly.e monthly.e yearly.e hourly.e
partially: ({Xd- & Xc+} & MVa-) or E+ or EB-;                
exactly: E+ or ({Xd- & Xc+} & MVa-) or EB- or EN+ or EZ+;              
well.e: ({EE- or EF+} & (({Xd- & Xc+} & MVa-) or Qe+ or Ca+ or [E+])) or 
[{EA- or EF+} & (Pa- or AF+)];

initially already somehow again
once_again nowadays sometimes nevertheless nonetheless at_first
at_best:
({Xd- & Xc+} & MVa-) or E+ or ({Xc+ & {Xd-}} & CO+) or EBm-;           
twice: ({Xd- & Xc+} & MVa-) or E+ or ({Xc+ & {Xd-}} & CO+) or EBm- or Yx+ or 
({EN-} & EZ+);           
hence: (Yt- & ({Xd- & Xc+} & MVa-)) or E+ or ({Xc+ & {Xd-}} & CO+) or EBm-;

otherwise formerly now.e lately: 
({Xd- & Xc+} & MVa-) or E+ or ({Xc+ & {Xd-}} & CO+) or EB-;
then.e: ({Xd- & Xc+} & MVa-) or E+ or ({Xc+ & {Xd-}} & CO+) or EB- or 
(Xd- & Xc+ & MVs- & S+);
gradually sadly broadly clearly
annually characteristically comparatively
confidentially currently fundamentally hypothetically
ironically justifiably momentarily mercifully
nominally ominously periodically precisely realistically
simultaneously subsequently superficially thankfully
unofficially effectively traditionally briefly eventually ultimately
mysteriously naturally oddly plainly truthfully appropriately:
{EE- or EF+} & (({Xd- & Xc+} & MVa-) or ({Xd- & Xc+} & E+) or ({Xc+ & {Xd-}}
 & CO+) or EBm- or Qe+ or Ca+ or [[EA+]]);
occasionally often specifically generally originally: 
{EE- or EF+} & (({Xd- & Xc+} & MVa-) or ({Xd- & Xc+} & E+) or 
({Xc+ & {Xd-}} & CO+) or EB- or Qe+ or Ca+);
recently: {EE- or EF+} & (({Xd- & Xc+} & MVa-) or E+ or ({Xc+ & {Xd-}} & CO+)
 or EB- or JT- or Ca+ or Qe+);
words/words.adv.1:  % angrily naively 
{EE- or EF+} & (({Xd- & Xc+} & MVa-) or Em+ or ({Xc+ & {Xd-}} & CO+) or Qe+
 or Ca+ or [[EA+]]);
shortly: {EE- or EF+} & (({Xd- & Xc+} & MVa-) or E+ or EI+ or ({Xc+ & {Xd-}}
 & CO+) or Qe+ or Ca+);
immediately: ({Xd- & Xc+} & MVa-) or E+ or EI+ or ({Xc+ & {Xd-}} & CO+);
soon: ({EE- or EF+} & (({Xd- & Xc+} & MVa-) or E+ or EI+ or ({Xc+ & {Xd-}}
 & CO+) or EB- or Qe+ or Ca+)) or ({EA- or EF+} & (Pa- or AF+));

yet.e: ({Xd- & Xc+} & MVa-) or EBm-;
someday sometime thereafter anyhow anyway overall.e
afterwards afterward lengthwise worldwide.e nationwide.e statewide.e
world-wide.e
nation-wide.e state-wide.e industrywide.e instead prima_facie before_long
by_hand by_car by_plane by_boat by_bus by_train by_phone 
by_telephone in_person at_long_last on_cue
on_arrival by_request in_total in_turn:
({Xd- & Xc+} & MVa-) or ({Xc+ & {Xd-}} & CO+);
high.e deep.e low.e: {EE- or EF+} & (({Xd- & Xc+} & MVa-) or ({Xc+ & {Xd-}}
 & CO+) or Ca+ or Qe+);
right.e straight.e: ({EE- or EF+} & (({Xd- & Xc+} & MVa-) or ({Xc+ & {Xd-}}
 & CO+) or Qe+ or Ca+))
or (Kx- & Ky+) or (Pp- & Pp+); 
short.e: {Yd- or EE- or EF+} & {OF+} & ({Xd- & Xc+} & MVa-);
				
hereby thereby newly reputedly: E+;                
rightly: {EE-} & E+;
necessarily no_longer: E+ or EBm-; 
ever: E+ or EBm- or EC+ or MVa-;

never.a always: {EN-} & (E+ or EB-);
seldom rarely.e: {EE-} & (E+ or EB-);
certainly possibly definitely: 
{EE-} & (({Xd- & Xc+} & E+) or EB- or (Xd- & Xc+ & MVa-));
probably: E+ or EB- or (Xd- & Xc+ & MVa-);
just: E+ or EB- or (MVl- & (MVa+ or MVp+ or MVs+)) or EN+ or EZ+;
words/words.adv.2: % fortunately allegedly
E+ or (Xd- & Xc+ & (E+ or MVa-)) or ({Xc+ & {Xd-}} & CO+) or EBm-;
not_suprisingly:
E+ or (Xd- & Xc+ & (E+ or MVa-)) or ({Xc+ & {Xd-}} & CO+) or EBm-;
though.e: (Xd- & Xc+ & (E+ or MVa-)) or ({Xc+ & {Xd-}} & CO+);
still.e presumably undoubtedly evidently apparently usually typically perhaps
 also:
E+ or (Xd- & Xc+ & (E+ or MVa-)) or ({Xc+ & {Xd-}} & CO+) or EB-;
mainly primarily: 
E+ or ({Xc+ & {Xd-}} & CO+) or EB- or (MVl- & (MVa+ or MVp+ or MVs+));

maybe: CO+;
meantime.e furthermore secondly thirdly
in_brief in_short in_sum: 
({Xd- & Xc+} & E+) or ({Xc+ & {Xd-}} & CO+);

in_fact of_course in_effect for_example for_instance: 
E+ or (Xd- & Xc+ & (E+ or MVa-)) or ({Xc+ & {Xd-}} & CO+) or EB-;

together: ({Xd- & Xc+} & MVa-) or E+ or K- or [Mp-];
only: L- or E+ or EN+ or EB- or (MVl- & (MVp+ or MVa+ or MVs+))
     or MVa- or (Rx+ & <CLAUSE-E>) or (MVp+ & Wq- & Q+);
never.i at_no_time not_once rarely.i since_when: {MVp+} & Wq- & Q+ & {CC+};
not_since: (J+ or Cs+) & Wq- & Q+ & {CC+};
even.e: E+ or EC+ or EB- or ((MVp+ or MVa+ or MVs+) 
& (MVl- or ({Xc+ & {Xd-}} & CO+))) or (Rx+ & <CLAUSE-E>);
not_even: Rx+ & <CLAUSE-E>;

too: {ECa-} & (EA+ or EE+ or ({Xd- & Xc+} & MVa-) or (Xd- & Xc+ & E+));
so: (EAxk+ & {HA+}) or EExk+ or 
((({Xd-} & CC-) or ({Xc+} & Wc-)) & (Wd+ or Qd+ or Ws+ or Wq+));
sufficiently: {EE-} & (EAxk+ or EExk+ or MVak-); 
so_that: {Xd-} & CC- & Wd+;
enough: ({OF+} & <noun-main-s>) or Dm+ or EF- or MVa-;

please.e: Wi- & I+;

%COMPARATIVES

more: ({ECa-} & (EAm+ or EEm+ or [MVm-] or [EB*m-] or Qe+ or Ca+)) or
({ECn-} & (Dmum+ or Om- or Jm- or (Ss+ & <CLAUSE>) or Bsm+)) or 
({Ecn- or ND-} & (Dmcm+ or Om- or Jm- or
(Sp+ & <CLAUSE>) or Bpm+)) or 
(DG- & (({MVa+} & Cs+) or B+ or Dm*w+ or EA+) & (ER- or (Wd- & Xc+ & ER+)));
more_of_a more_of_an: Ds*m+;
less: ({ECn-} & (Dmum+ or Om- or Jm- or (Ss+ & <CLAUSE>) or Bsm+)) 
or ({ECa-} & (EAm+ or EEm+ or [MVm-] or [EB*m-])) or 
(DG- & (({MVa+} & Cs+) or B+ or Dm*w+ or EA+) & (ER- or (Wd- & Xc+ & ER+)));
fewer: ({ECn-} & (Dmcm+ or Om- or Jm- or (Sp+ & <CLAUSE>))) 
or (DG- & Dm*w+ & (ER- or (Wd- & Xc+ & ER+)));
farther: ({ECa-} & {K+} & (MVb- or Qe+ or Ca+)) or A+;
further.e: ({ECa-} & {K+} & (MVb- or Qe+ or Ca+)) or A+ or E+
or ({Xd-} & Xc+ & CO+);

as.y: {EZ-} & ((EAy+ & {HA+}) or EEy+ or AM+);
as.z: 
(MVz- & (((O*c+ or S**c+ or ({SFsic+} & Zc+)) & {Mp+}) or Mpc+ or Cc+))
or (MVzo- & Bc+ & {U+}) or (MVzp- & (CX+ or CQ+)) or (MVza- & ((AFd+ & {Pa+})
 or PFc+));
as.p: ((Cs+ or J+ or Mp+ or TI+ or ({SFsic+} & Zs+)) & 
(({Xc+ & {Xd-}} & CO+) or ({Xd- & Xc+} & MVs-))) or (Mp- & (J+ or Mp+ or BIt+)
) or 
(AZ- & (Pa+ or Mg+)) or [[(PFc+ or CQ+) & ({Xd- & Xc+} & MVs-)]];
as_possible: MVz-;
as_expected as_reported as_imagined as_suspected as_anticipated as_predicted
as_realized as_proposed as_intended as_supposed: MVz- or 
(({Xc+ & {Xd-}} & CO+) or ({Xd- & Xc+} & MVs-));

much:
({EE-} & (MVa- or ECa+ or Ca+ or Qe+)) or ({EEx- or H-} & (ECn+ or Dmu+ or 
(<noun-sub-s> & (<noun-main-s> or Bsm+)))) or 
(AM- & (Dmuy+ or MVy- or Oy- or Jy- or EB*y-));
slightly somewhat: EC+ or EA+ or MVa- or Em+;
far.c infinitely: EC+;
significantly substantially: {EE- or EF+} & 
(EC+ or E+ or MVa- or ({Xc+ & {Xd-}} & CO+));

words/words.adj.2: %bigger older
({ECa-} & (((Pam- or Mam- or AFm+) & {@MV+}) or ({[[@Ec-]]} & {Xc+} & Am+)))
 or 
(DG- & (TR+ or AF+) & {@MV+} & (ER- or (Wd- & Xc+ & ER+)));
easier: ({ECa-} & (({[[@Ec-]]} & {Xc+} & Am+) or ((Pafm- or AFm+ or Mam-) 
& {@MV+} & {((TOt+ & B+) or TOi+) & {LE+}}))) or 
(DG- & (TR+ or AF+) & {@MV+} & {(TOt+ & B+) or TOi+} & (ER- or (Wd- & Xc+ &
 ER+)));
harder: ({ECa-} & (({[[@Ec-]]} & {Xc+} & Am+) or ((Pafm- or AFm+ or Mam-)  
& {@MV+} & {((TOt+ & B+) or TOi+) & {LE+}}) or
 MVb-)) or (DG- & (TR+ or AF+) & {@MV+} & {(TOt+ & B+) or TOi+} & 
(ER- or (Wd- & Xc+ & ER+)));
longer higher deeper lower.a faster sooner:
({ECa-} & (((Pam- or AFm+ or Mam-) & {@MV+}) or ({[[@Ec-]]} & {Xc+} & Am+) 
or MVb- or Qe+ or Ca+)) or
(DG- & (TR+ or AF+ or Cs+) & {@MV+} & (ER- or (Wd- & Xc+ & ER+)));
smarter nicer worse:
({ECa-} & (({[[@Ec-]]} & {Xc+} & Am+) or ((Pafm- or AFm+ or Mam-) & 
{@MV+} & {(TOi+ or THi+) & {LE+}}))) or
(DG- & (TR+ or AF+) & {@MV+} & {TOi+ or THi+} & (ER- or (Wd- & Xc+ & ER+)));
better: 
({ECa-} & (({[[@Ec-]]} & {Xc+} & Am+) or ((Pafm- or AFm+ or Mam-) 
& {@MV+} & {(TOi+ or THi+) & {LE+}}) or MVb- or E+ or Qe+ or Ca+)) or
(DG- & (TR+ or AF+) & {@MV+} & {TOi+ or THi+} & (ER- or (Wd- & Xc+ & ER+)));
different: {ECa- or EA- or EF+} & 
(({[[@Ec-]]} & {Xc+} & Am+) or ((Pafm- or AFm+ or Mam-)
 & {@MV+}) or AA+ or [[DD- & <noun-main-p>]] or <adj-op>);

than: (MVt- & (((O*c+ or ({SFsic+} & Zc+) or U*c+) & {Mp+})
 or Mpc+ or S**c+ or MVat+ or MVpt+ or Cc+ or Pafc+))
or ((MVta- or LE-) & ((AFd+ & {Pa+}) or PFc+)) or 
((MVti- or LEi-) & AFdi+ & {Pa+}) or
(((LE- & {AFd+}) or (LEi- & {AFdi+})) & (THc+ or TOic+ or TOfc+ or 
(TOtc+ & B+))) or (Mc- & J+ & EXx+) 
or (((MVto- & Bc+ & {U+}) or (MVtp- & (CX+ or CQ+))) & {Mp+});

than_expected than_imagined than_proposed than_suspected than_realized 
than_intended than_supposed than_reported than_ever: MVt-;
	
more_than no_more_than fewer_than less_than as_many_as an_estimated 
an_additional up_to as_much_as: EN+;
at_least: EN+ or CO+ or [[{Xd- & Xc+} & MVa-]];
all_but: EN+ or E+;

words/words.adj.3: % biggest oldest
({Xc+} & {NR-} & {[[@Ec-]]} & L-) or 
({NR- or ND-} & DD- & <noun-sub-x> & {TOn+} & <noun-main-x>);
%  check these categories for Ma-
sole.a main.a: {Xc+} & {NR-} & {[[@Ec-]]} & L-;
same own.a: ({Xc+} & {NR-} & {[[@Ec-]]} & L-) or  
(DD- & <noun-sub-x> & {TOn+} & <noun-main-x>);
the_same: {EZ-} & (D**y+ or Oy- or Jy- or MVy-);
next: ({Xc+ & {Xd-}} & CO+) or MVp- or DTi+ or
({Xc+} & {NR-} & {[[@Ec-]]} & L-)  
or (DD- & <noun-sub-x> & {TOn+} & <noun-main-x>);
past.a previous: ({[[@Ec-]]} & {Xc+} & A+) or L- or (Pa- & {@MV+}); 
following.a remaining.a top.i: L-;
hardest easiest: ({Xc+} & {NR-} & {[[@Ec-]]} & L-) or  
({NR- or ND-} & DD- & <noun-sub-x> & {TOt+ & B+} & <noun-main-x>);
worst longest fastest furthest farthest: 
({Xc+} & {NR-} & {[[@Ec-]]} & L-) or  
({NR- or ND-} & DD- & ((<noun-sub-x> & {TOn+} & <noun-main-x>) or MVa-));
best: ({Xc+} & {NR-} & {[[@Ec-]]} & L-) or  
({NR- or ND-} & DD- & ((<noun-sub-x> & {TOn+} & <noun-main-x>) or MVa-)) or 
[[E+]];

% MISCELLANEOUS WORDS AND PUNCTUATION

LEFT-WALL: (Qd+ or Wd+ or Wq+ or Ws+ or Wj+ or Wi+ or Wc+) & {CP+} & {Xx+} & 
{RW+ or Xp+};       
RIGHT-WALL: RW- or ({@Xca-} & Xc-);

etc: Xd- & Xc+ & (MX- or MVa-);
so_on the_like: (<noun-sub-x> & <noun-main-x>) or ((<verb-i> or
<verb-sp,pp> or <verb-pg,ge> or <verb-pv>) & {@MV+}) or M- or MV-;

er um umm uh oh yeah yes gee gosh wow: NO+;

".": ((Xp- or ({@Xca-} & Xc-)) & RW+) or Xi-;

"!" "?": (Xp- or ({@Xca-} & Xc-)) & RW+;

",": {@Xca-} & (({EBx+} & Xd+) or Xc-);

";": {@Xca-} & Xx- & (W+ or Qd+) & {Xx+};

":": {@Xca-} & Xx- & (W+ or J+ or Qd+ or TH+ or TO+) & {Xx+};

"%": (ND- & {DD-} & <noun-sub-x> & 
(<noun-main-x> or B*x+)) or (ND- & (OD- or AN+));

"$": NIax+ & (AN+ or NIay- or [[G+]] or ({EN- or NIc-} & 
(OD- or ({DD-} & {[[@M+]]} & (<noun-main-p> or [[(Ss+ & <CLAUSE>) or 
SIs-]])))));

"&": G- & {Xd- & G-} & G+;

"'": YP- & (DD+ or ({AL-} & {@L+} & D+) or [[<noun-main-x>]] or DP+);
"'s.p": YS- & (DD+ or ({AL-} & {@L+} & D+) or [[<noun-main-x>]] or DP+);

"(": {EBx+} & Xd+;
")": {@Xca-} & Xc-;

--: [[{@Xca-} & Xx- & (W+ or J+ or Qd+ or TH+ or TO+) & {Xx+}]] or
({@Xca-} & (({EBx+} & Xd+) or Xc-));

POSTPROCESS: BOGUS+;   % the existance of this word turns on post-processing

UNKNOWN-WORD.n: ({@AN-} & {@A- & {[[@AN-]]}} & (({D-} & <noun-sub-x> & 
(<noun-main-x> or B*m+))
or (YS+ & {D-}) or (GN+ & (DD- or [()])) or U-));
UNKNOWN-WORD.v: {@E-} & (((S- or (RS- & B-) or I- or Wi- or PP-) & {B- or O+}
 & {@MV+}) or ((Pv- or [Mv-]) & {@MV+}));
UNKNOWN-WORD.a: {EA- or EF+} & (({[[@Ec-]]} & {Xc+} & A+) or ((Pa- or AF+ or
 Ma-)  & {@MV+}) or AA+ or [[DD- & <noun-main-p>]] or <adj-op>);
UNKNOWN-WORD.e: [[{EE- or EF+} & (({Xd- & Xc+} & MVa-) or Em+ or ({Xc+ & 
{Xd-}} & CO+) or Qe+ or Ca+ or [[EA+]])]];

ANDABLE-CONNECTORS:   % these are the connectors that can be combined by
                      % conjunctions 
      
      S+ & S- & B+ & B- & O+ & O- & I+ &
      M+ & M- & R+ & I- &  
      TH+  & C+ & TH- & C- & QI- & TO- & P- & J- & PP- &
      QI+ & J+ &  
      A- & U+ & E- & E+ & MV- & MV+ & A+ & EA- & 
      YP+ & YS+ & D- & D+ &            
      DD- & RS- & SI- & Wi- & Wq- & Ws- & Q- & AN+ & Wd- & 
      G+ & CO- & CO+ & L-  & GN- & GN+ & BI- & TI- & CC+ & Xd- &
      Xc+ & MX-;



