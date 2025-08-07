// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Scroll Repel Rite
/// @notice Symbolic force field that blocks repeat violators from re-entry
contract vinScrollRepelRite {
    address public creator;
    string public repelName = "Vinvin's Scroll Repel Rite";

    struct RepelledEntity {
        string name;
        string reason;
        uint timestamp;
        bool isRepelled;
    }

    mapping(address => RepelledEntity) public repelled;
    address[] public repelledList;

    event EntityRepelled(string name, string reason, uint timestamp);
    event AttemptBlocked(address indexed entity);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can repel");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function repel(address _entity, string memory _name, string memory _reason) public onlyCreator {
        repelled[_entity] = RepelledEntity(_name, _reason, block.timestamp, true);
        repelledList.push(_entity);
        emit EntityRepelled(_name, _reason, block.timestamp);
    }

    function attemptEntry(address _entity) public view returns (string memory) {
        if (repelled[_entity].isRepelled) {
            return "🚫 Entry Blocked: Entity is repelled by Vinvin's scroll.";
        }
        return "✅ Entry Allowed: No repel record found.";
    }

    function getRepelledEntity(address _entity) public view returns (RepelledEntity memory) {
        return repelled[_entity];
    }

    function getAllRepelledEntities() public view returns (address[] memory) {
        return repelledList;
    }
}
