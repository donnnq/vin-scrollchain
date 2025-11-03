// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsumerComebackTreaty {
    address public steward;

    struct ComebackClause {
        string mallName;
        string comebackSignal;
        string activationProtocol;
        string emotionalTag;
    }

    ComebackClause[] public treatyLog;

    event ConsumerComebackTagged(string mallName, string comebackSignal, string activationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagComeback(
        string memory mallName,
        string memory comebackSignal,
        string memory activationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ComebackClause(mallName, comebackSignal, activationProtocol, emotionalTag));
        emit ConsumerComebackTagged(mallName, comebackSignal, activationProtocol, emotionalTag);
    }
}
