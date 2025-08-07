// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Scroll Forgiveness Chamber
/// @notice Allows Vinvin to forgive and unrepel entities symbolically
contract vinScrollForgivenessChamber {
    address public creator;
    string public chamberName = "Vinvin's Scroll Forgiveness Chamber";

    mapping(address => bool) public isForgiven;
    address[] public forgivenList;

    event EntityForgiven(address indexed entity, uint timestamp);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can forgive");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function forgive(address _entity) public onlyCreator {
        isForgiven[_entity] = true;
        forgivenList.push(_entity);
        emit EntityForgiven(_entity, block.timestamp);
    }

    function checkForgiveness(address _entity) public view returns (bool) {
        return isForgiven[_entity];
    }

    function getAllForgivenEntities() public view returns (address[] memory) {
        return forgivenList;
    }
}
