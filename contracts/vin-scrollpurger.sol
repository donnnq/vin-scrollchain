// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface SelfDestructible {
    function nuke(address payable recipient) external;
}

contract ScrollPurger {
    struct Target {
        address contractAddress;
        uint256 lastActive;
        bool flagged;
    }

    mapping(address => Target> public targets;
    mapping(address => bool) public preserveList;

    address public scrollTreasury;
    address public owner;

    event ContractFlagged(address contractAddress, string reason);
    event ContractPurged(address contractAddress);
    event ContractPreserved(address contractAddress, bool status);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not scrollholder");
        _;
    }

    constructor(address _treasury) {
        scrollTreasury = _treasury;
        owner = msg.sender;
    }

    function flagDormant(address _contract) public onlyOwner {
        targets[_contract] = Target(_contract, block.timestamp, true);
        emit ContractFlagged(_contract, "Dormant > 7 days");
    }

    function markAsPreserved(address _contract, bool _preserve) public onlyOwner {
        preserveList[_contract] = _preserve;
        emit ContractPreserved(_contract, _preserve);
    }

    function purge(address payable _contract) public onlyOwner {
        require(targets[_contract].flagged, "Not flagged");
        require(!preserveList[_contract], "This scroll is sacred.");
        require(block.timestamp >= targets[_contract].lastActive + 7 days, "Too early");

        SelfDestructible(_contract).nuke(payable(scrollTreasury));
        emit ContractPurged(_contract);
    }
}
