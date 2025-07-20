// SPDX-License-Identifier: Mythstream-CircleGov
pragma solidity ^0.8.26;

contract CirclePollHandler {
    address public sovereign; // VINVIN scrollkeeper
    uint256 public totalCirclePolls;

    struct CirclePoll {
        string jurisdiction;
        string topic;
        string patchSummary;
        string activationDate;
        address pollInitiator;
    }

    mapping(uint256 => CirclePoll) public circleLogs;

    event CircleScrollSubmitted(
        string jurisdiction,
        string topic,
        string patchSummary,
        string activationDate,
        address indexed pollInitiator
    );

    modifier onlyJurisdictionAgent() {
        require(msg.sender != address(0), "Unauthorized scroll ping");
        _;
    }

    constructor(address _sovereign) {
        sovereign = _sovereign;
    }

    function submitScrollLog(
        string memory jurisdiction,
        string memory topic,
        string memory patchSummary,
        string memory activationDate
    ) external onlyJurisdictionAgent {
        totalCirclePolls++;

        circleLogs[totalCirclePolls] = CirclePoll({
            jurisdiction: jurisdiction,
            topic: topic,
            patchSummary: patchSummary,
            activationDate: activationDate,
            pollInitiator: msg.sender
        });

        emit CircleScrollSubmitted(jurisdiction, topic, patchSummary, activationDate, msg.sender);
    }

    function getCircleLog(uint256 pollId) external view returns (CirclePoll memory) {
        return circleLogs[pollId];
    }
}
