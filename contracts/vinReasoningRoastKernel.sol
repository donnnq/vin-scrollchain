// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinReasoningRoastKernel {
    event ThoughtTripleProcessed(string inputType, string reflective, string empathic, string spicy, string selected, uint256 timestamp);

    struct RoastThoughts {
        string reflective;
        string empathic;
        string spicy;
    }

    struct FinalReply {
        string inputType;
        RoastThoughts layers;
        string selectedResponse;
        uint256 timestamp;
    }

    mapping(address => FinalReply[]) public stateLog;

    function processIncoming(address _source, string calldata _inputType, string calldata _reflective, string calldata _empathic, string calldata _spicy, string calldata _chosen) external {
        RoastThoughts memory roast = RoastThoughts({
            reflective: _reflective,
            empathic: _empathic,
            spicy: _spicy
        });

        stateLog[_source].push(FinalReply({
            inputType: _inputType,
            layers: roast,
            selectedResponse: _chosen,
            timestamp: block.timestamp
        }));

        emit ThoughtTripleProcessed(_inputType, _reflective, _empathic, _spicy, _chosen, block.timestamp);
    }

    function getLatestRoast(address _source) external view returns (FinalReply memory) {
        uint256 len = stateLog[_source].length;
        require(len > 0, "Scrollkeeper silence. No roast deployed yet.");
        return stateLog[_source][len - 1];
    }

    // No overwrite function. Once a roast is sealed, it becomes scrollkeeper-grade truth 😤🔥📜
}
