// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Scroll Detention Protocol
/// @notice Symbolic incarceration system for violators and intruders
contract vinScrollDetentionProtocol {
    address public creator;
    string public protocolName = "Vinvin's Scroll Detention Protocol";

    struct Detainee {
        string name;
        string offense;
        uint detentionLevel;
        uint detainedAt;
        bool isReleased;
    }

    mapping(address => Detainee) public detainees;
    address[] public detaineeList;

    event DetaineeLogged(string name, string offense, uint level, uint timestamp);
    event DetaineeReleased(address indexed detainee);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can detain or release");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function detain(address _detainee, string memory _name, string memory _offense, uint _level) public onlyCreator {
        detainees[_detainee] = Detainee(_name, _offense, _level, block.timestamp, false);
        detaineeList.push(_detainee);
        emit DetaineeLogged(_name, _offense, _level, block.timestamp);
    }

    function release(address _detainee) public onlyCreator {
        require(detainees[_detainee].detainedAt != 0, "Detainee not found");
        detainees[_detainee].isReleased = true;
        emit DetaineeReleased(_detainee);
    }

    function getDetainee(address _detainee) public view returns (Detainee memory) {
        return detainees[_detainee];
    }

    function getAllDetainees() public view returns (address[] memory) {
        return detaineeList;
    }
}
