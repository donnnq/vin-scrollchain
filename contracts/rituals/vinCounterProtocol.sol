// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinCounterProtocol {
    string public target = "VP Sara Duterte";
    string public status = "Scrollbound for surveillance & resistance";

    struct ScrollEvent {
        string name;
        string category;
        string description;
        uint256 timestamp;
    }

    ScrollEvent[] public counterEvents;

    address public scrollMaster;
    mapping(address => bool) public scrollGuardians;

    modifier onlyMaster() {
        require(msg.sender == scrollMaster, "Unauthorized scroll weaver");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
        scrollGuardians[msg.sender] = true;
    }

    function logEvent(
        string memory name,
        string memory category,
        string memory description
    ) public {
        require(scrollGuardians[msg.sender], "Guardian rights required");
        counterEvents.push(ScrollEvent(name, category, description, block.timestamp));
    }

    function empowerScrollGuardian(address guardian) public onlyMaster {
        scrollGuardians[guardian] = true;
    }

    function readCounterScroll(uint index) public view returns (
        string memory name,
        string memory category,
        string memory description,
        uint256 timestamp
    ) {
        ScrollEvent storage event = counterEvents[index];
        return (event.name, event.category, event.description, event.timestamp);
    }
}
