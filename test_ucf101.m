%% test_ucf101.m

function [label, accuracy, predict_prob] = test_ucf101(test_label_path, test_data_path, model)
    label_int = load(test_label_path);
    label_double = double(label_int);
    label_size = size(label_double)
    data = create_svm_input_data(test_data_path);
    data_size = size(data)
    [label, accuracy, predict_prob] = svmpredict(label_double, data, model);
end