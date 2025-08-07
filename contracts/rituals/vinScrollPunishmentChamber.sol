// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Scroll Punishment Chamber
/// @notice Logs intruders, traitors, and violators with symbolic penalties
contract vinScrollPunishmentChamber {
    address public creator;
    string public chamberName = "Vinvin's Scroll Punishment Chamber";

    struct Offender {
        string name;
        string offense;
        uint severity;
        uint timestamp;
        bool isMarked;
    }

    mapping(address => Offender) public offenders;
    address[] public offenderList;

    event OffenseLogged(string name, string offense, uint severity, uint timestamp);
    event MarkedForJudgment(address indexed offender);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can judge");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function logOffense(address _offender, string memory _name, string memory _offense, uint _severity) public onlyCreator {
        offenders[_offender] = Offender(_name, _offense, _severity, block.timestamp, true);
        offenderList.push(_offender);
        emit OffenseLogged(_name, _offense, _severity, block.timestamp);
        emit MarkedForJudgment(_offender);
    }

    function getOffender(address _offender) public view returns (Offender memory) {
        return offenders[_offender];
    }

    function getAllOffenders() public view returns (address[] memory) {
        return offenderList;
    }

    function isMarked(address _offender) public view returns (bool) {
        return offenders[_offender].isMarked;
    }
}
