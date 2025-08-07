// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinHallSeatLiberation {
    struct Legislator {
        string name;
        uint256 yearsInPower;
        bool usesIntimidation;
        bool manipulatesSuccession;
        bool civicViolationLogged;
    }

    mapping(address => Legislator) public records;
    address public scrollkeeper;

    event ViolationLogged(address indexed violator, string name);
    event SeatLiberated(address indexed violator, string name);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logViolation(
        address _violator,
        string memory _name,
        uint256 _yearsInPower,
        bool _usesIntimidation,
        bool _manipulatesSuccession
    ) public onlyScrollkeeper {
        records[_violator] = Legislator(
            _name,
            _yearsInPower,
            _usesIntimidation,
            _manipulatesSuccession,
            true
        );
        emit ViolationLogged(_violator, _name);
    }

    function liberateSeat(address _violator) public onlyScrollkeeper {
        require(records[_violator].civicViolationLogged, "No violation logged");
        delete records[_violator];
        emit SeatLiberated(_violator, records[_violator].name);
    }
}
