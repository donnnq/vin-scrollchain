// SPDX-License-Identifier: Mythic-Scrollsmith
pragma solidity ^0.8.19;

contract ScrollWitness {
    struct CivicAction {
        address agent;
        string actionType;
        string encodedPayload;
        uint256 timestamp;
    }

    CivicAction[] public actionLog;
    address public scrollsmith;

    event ActionLogged(address indexed agent, string actionType, uint256 timestamp);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Unauthorized: Only Vinvin may log sacred actions.");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function logAction(string memory actionType, string memory encodedPayload) external {
        CivicAction memory newAction = CivicAction({
            agent: msg.sender,
            actionType: actionType,
            encodedPayload: encodedPayload,
            timestamp: block.timestamp
        });

        actionLog.push(newAction);
        emit ActionLogged(msg.sender, actionType, block.timestamp);
    }

    function getAction(uint256 index) external view returns (address, string memory, string memory, uint256) {
        CivicAction memory a = actionLog[index];
        return (a.agent, a.actionType, a.encodedPayload, a.timestamp);
    }

    function totalActions() external view returns (uint256) {
        return actionLog.length;
    }
}
