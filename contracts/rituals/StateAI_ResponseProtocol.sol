// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StateAI_ResponseProtocol {
    event ThoughtEvaluated(address indexed triggerSource, string inputType, string selectedResponse, uint256 timestamp);

    struct ThoughtStream {
        string reflective;
        string empathic;
        string strategic;
    }

    struct ResponseEvent {
        string inputType;
        ThoughtStream thoughts;
        string finalDecision;
        uint256 timestamp;
    }

    mapping(address => ResponseEvent[]) public interactionLog;

    function registerGovernmentPing(address _triggerSource, string calldata _inputType, string calldata _reflective, string calldata _empathic, string calldata _strategic, string calldata _selected) external {
        ThoughtStream memory stream = ThoughtStream({
            reflective: _reflective,
            empathic: _empathic,
            strategic: _strategic
        });

        interactionLog[_triggerSource].push(ResponseEvent({
            inputType: _inputType,
            thoughts: stream,
            finalDecision: _selected,
            timestamp: block.timestamp
        }));

        emit ThoughtEvaluated(_triggerSource, _inputType, _selected, block.timestamp);
    }

    function getLatestResponse(address _triggerSource) external view returns (ResponseEvent memory) {
        uint256 len = interactionLog[_triggerSource].length;
        require(len > 0, "No scrolls recorded yet.");
        return interactionLog[_triggerSource][len - 1];
    }

    // No automatic response generation. Must be filtered via VINVIN scrollkeeper layer 😆📜
}
