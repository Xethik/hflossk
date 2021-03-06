<%inherit file="master.mak" />

<div class="hero-unit">
<h1>Participants</h1>
<p>Should have ${int(target_number)} blog posts</p>
<p>
<!--<p><a href="#" class="btn btn-primary btn-large">Generate Report&raquo;</a></p>-->
</div>

<div class="row-fluid">
  %for student in student_data:
    <div class="span4 shadowcard padded">
    <img class="uglymug" src="${gravatar(student['rit_dce'] + '@rit.edu')}" alt="${student['irc']}'s Avatar" />
    <h4 class="irc_nick">${student['irc']}</h4>
    <div class="sticky padded ${'good' if student_posts[student['irc']] >= target_number else 'bad'}">
    <i class="icon-pencil"></i>
    <span>${student_posts[student['irc']]}</span></div>
    <p><a target="_blank" href="${student['blog']}">Blog</a></p>
    <ul class="unstyled cardlist">

    % for geordi in student['forges']:
    <li><a target="_blank" href="${geordi}">${geordi}</a></li>
    %endfor

    % if student_quizes.get(student['irc']):
    <li><a target="_blank" href="${student_quizes[student['irc']]}">Quiz1</a></li>
    % else:
    <li class="redtext">quiz1?</li>
    % endif

    % if student_litreview1.get(student['irc']):
    <li><a target="_blank" href="${student_litreview1[student['irc']]}">litreview1</a></li>
    % else:
    <li class="redtext">litreview1?</li>
    % endif

    </ul>
    <p><a class="btn" href="#">View details &raquo;</a></p>
    </div><!--/span-->
    %if (loop.index + 1) % 3 == 0:
        </div>
        <div class="row-fluid">
    %endif
  %endfor
</div><!--/row-->
