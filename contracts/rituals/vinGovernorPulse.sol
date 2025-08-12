// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinGovernorPulse {
    address public governor;
    string public province = "Bulacan";

    struct Insight {
        string title;
        string message;
        uint256 timestamp;
    }

    Insight[] public insights;

    event InsightLogged(string title, uint256 timestamp);

    constructor(address _governor) {
        governor = _governor;
    }

    modifier onlyGovernor() {
        require(msg.sender == governor, "Only the governor can log insights.");
        _;
    }

    function logInsight(string memory _title, string memory _message) public onlyGovernor {
        insights.push(Insight(_title, _message, block.timestamp));
        emit InsightLogged(_title, block.timestamp);
    }

    function getInsight(uint256 index) public view returns (Insight memory) {
        return insights[index];
    }
}
