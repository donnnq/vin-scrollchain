// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinGlobalSupportPact {
    address public enforcerAuthority = 0xUSPOWER;
    uint public supportDuration = 180 days;

    struct Leader {
        string name;
        string country;
        bool isAccepted;
    }

    mapping(address => Leader) public leaders;
    mapping(address => uint) public supportStart;

    event PactSigned(address indexed leader, string country);
    event SupportActivated(address indexed leader, string country);
    event SupportExpired(address indexed leader, string country);

    modifier onlyAcceptedLeader() {
        require(leaders[msg.sender].isAccepted, "Leader not verified for pact.");
        _;
    }

    function signPact(string memory _name, string memory _country) public {
        leaders[msg.sender] = Leader(_name, _country, true);
        emit PactSigned(msg.sender, _country);
    }

    function requestSupport() public onlyAcceptedLeader {
        require(supportStart[msg.sender] == 0, "Support already active.");
        supportStart[msg.sender] = block.timestamp;
        emit SupportActivated(msg.sender, leaders[msg.sender].country);
    }

    function checkSupportStatus(address _leader) public view returns (string memory) {
        if (supportStart[_leader] == 0) return "No support requested.";
        if (block.timestamp >= supportStart[_leader] + supportDuration) return "Support duration expired.";
        return "Active support ongoing.";
    }

    function expireSupport() public {
        require(block.timestamp >= supportStart[msg.sender] + supportDuration, "Support still active.");
        emit SupportExpired(msg.sender, leaders[msg.sender].country);
        supportStart[msg.sender] = 0;
    }
}
