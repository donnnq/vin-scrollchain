// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollAltar {
    enum OfferingType { Relic, Oath, Sigil }

    struct Offering {
        OfferingType offeringType;
        string name;
        string message;
        address devotee;
        uint256 timestamp;
    }

    Offering[] public offerings;
    address public immutable altarKeeper;

    event OfferingMade(uint256 indexed id, OfferingType offeringType, string name, address devotee, string message, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == altarKeeper, "Not the altar keeper");
        _;
    }

    constructor() {
        altarKeeper = msg.sender;
    }

    function offer(
        OfferingType offeringType,
        string calldata name,
        string calldata message
    ) external {
        offerings.push(Offering({
            offeringType: offeringType,
            name: name,
            message: message,
            devotee: msg.sender,
            timestamp: block.timestamp
        }));

        emit OfferingMade(offerings.length - 1, offeringType, name, msg.sender, message, block.timestamp);
    }

    function getOffering(uint256 id) external view returns (Offering memory) {
        require(id < offerings.length, "Invalid offering ID");
        return offerings[id];
    }

    function totalOfferings() external view returns (uint256) {
        return offerings.length;
    }
}
