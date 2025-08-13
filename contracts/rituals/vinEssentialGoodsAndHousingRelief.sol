// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinEssentialGoodsAndHousingRelief {
    address public steward;

    struct Resident {
        string name;
        bool goodsPaid;
        bool housed;
        uint256 monthlyRent;
    }

    mapping(address => Resident) public residents;

    event ReliefGranted(address indexed resident, string name, uint256 rent);
    event GoodsPaid(address indexed resident, string name);
    event HousingAssigned(address indexed resident, string name, uint256 rent);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can perform this action");
        _;
    }

    function grantRelief(address residentAddress, string memory name) public onlySteward {
        residents[residentAddress] = Resident(name, true, true, 150);
        emit ReliefGranted(residentAddress, name, 150);
        emit GoodsPaid(residentAddress, name);
        emit HousingAssigned(residentAddress, name, 150);
    }

    function getResidentStatus(address residentAddress) public view returns (string memory, bool, bool, uint256) {
        Resident memory r = residents[residentAddress];
        return (r.name, r.goodsPaid, r.housed, r.monthlyRent);
    }
}
