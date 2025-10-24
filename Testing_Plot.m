clear; close all;

% Load data
blocked = load('BothTest_Blocked.mat');
interleaved = load('BothTest_Interleaved.mat');

%% General Performance
figure
bar_data = [mean(blocked.Accuracy(blocked.Subspace <= 2)), ...
            mean(interleaved.Accuracy(interleaved.Subspace <= 2))];
sem_data = [std(blocked.Accuracy(blocked.Subspace <= 2))/sqrt(118), ...
            std(interleaved.Accuracy(interleaved.Subspace <= 2))/sqrt(54)];

bar(bar_data); hold on;
errorbar(1:2, bar_data, sem_data, 'k--');
ylim([0.6,0.9]);
set(gca, 'XTick', 1:2, 'XTickLabels', {'Blocked', 'Interleaved'});
ylabel('Accuracy');
title('General Performance');

%% General: Same vs Different Structures
figure;
for i = 1:2
    subplot(1,2,i);
    if i == 1
        data = blocked; titleTxt = 'Blocked';
    else
        data = interleaved; titleTxt = 'Interleaved';
    end

    sameIdx = data.Subspace == 1;
    diffIdx = data.Subspace == 2;

    bar_data = [mean(data.Accuracy(sameIdx)), mean(data.Accuracy(diffIdx))];
    sem_data = [std(data.Accuracy(sameIdx))/sqrt(sum(sameIdx)), ...
                std(data.Accuracy(diffIdx))/sqrt(sum(diffIdx))];

    bar(bar_data); hold on;
    errorbar(1:2, bar_data, sem_data, 'k--');
    ylim([0.6,0.9]);
    set(gca, 'XTick', 1:2, 'XTickLabels', {'Same', 'Different'});
    ylabel('Accuracy');
    title(titleTxt);
end
sgtitle('General: Same vs Different Structures');

%% General Blocked Order (Spatial First vs Conceptual First)
nSubs = numel(blocked.Accuracy);
half = floor(nSubs/2);

figure;
for i = 1:2
    subplot(1,2,i);
    if i == 1
        idx = 1:half; titleTxt = 'Spatial First';
    else
        idx = (half+1):nSubs; titleTxt = 'Conceptual First';
    end

    sameIdx = blocked.Subspace == 1 & ismember(1:nSubs, idx);
    diffIdx = blocked.Subspace == 2 & ismember(1:nSubs, idx);

    bar_data = [mean(blocked.Accuracy(sameIdx)), mean(blocked.Accuracy(diffIdx))];
    sem_data = [std(blocked.Accuracy(sameIdx))/sqrt(sum(sameIdx)), ...
                std(blocked.Accuracy(diffIdx))/sqrt(sum(diffIdx))];

    bar(bar_data); hold on;
    errorbar(1:2, bar_data, sem_data, 'k--');
    ylim([0.6,0.9]);
    set(gca, 'XTick', 1:2, 'XTickLabels', {'Same', 'Different'});
    ylabel('Accuracy');
    title(titleTxt);
end
sgtitle('General: Blocked Order');

%% OLD / NEW ACCURACY SECTIONS
types = {'Old', 'New'};
for t = 1:2
    field = [types{t} 'Acc'];
    sg = [types{t} ' Performance'];

    % General
    figure;
    bar_data = [mean(blocked.(field)(blocked.Subspace <= 2)), ...
                mean(interleaved.(field)(interleaved.Subspace <= 2))];
    sem_data = [std(blocked.(field))/sqrt(118), std(interleaved.(field))/sqrt(54)];
    bar(bar_data); hold on;
    errorbar(1:2, bar_data, sem_data, 'k--');
    ylim([0.6,0.9]);
    set(gca, 'XTick', 1:2, 'XTickLabels', {'Blocked', 'Interleaved'});
    ylabel('Accuracy');
    title(sg);

    % Same vs Different
    figure;
    for i = 1:2
        subplot(1,2,i);
        if i == 1
            data = blocked; titleTxt = 'Blocked';
        else
            data = interleaved; titleTxt = 'Interleaved';
        end

        sameIdx = data.Subspace == 1;
        diffIdx = data.Subspace == 2;

        bar_data = [mean(data.(field)(sameIdx)), mean(data.(field)(diffIdx))];
        sem_data = [std(data.(field)(sameIdx))/sqrt(sum(sameIdx)), ...
                    std(data.(field)(diffIdx))/sqrt(sum(diffIdx))];

        bar(bar_data); hold on;
        errorbar(1:2, bar_data, sem_data, 'k--');
        ylim([0.6,0.9]);
        set(gca, 'XTick', 1:2, 'XTickLabels', {'Same', 'Different'});
        ylabel('Accuracy');
        title(titleTxt);
    end
    sgtitle([types{t} ': Same vs Different Structures']);
end
