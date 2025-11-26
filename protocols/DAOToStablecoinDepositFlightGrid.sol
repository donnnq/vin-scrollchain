// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToStablecoinDepositFlightGrid {
    string public batchID = "1321.9.123";
    string public steward = "Vinvin";

    address public admin;

    struct DepositShift {
        address depositor;
        uint256 amount;
        string fromBank;
        string toStablecoin;
        uint256 timestamp;
    }

    DepositShift[] public shifts;

    event DepositFlight(address indexed depositor, uint256 amount, string fromBank, string toStablecoin);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logShift(address depositor, uint256 amount, string memory fromBank, string memory toStablecoin) public onlyAdmin {
        shifts.push(DepositShift(depositor, amount, fromBank, toStablecoin, block.timestamp));
        emit DepositFlight(depositor, amount, fromBank, toStablecoin);
    }

    function getShift(uint256 index) public view returns (address depositor, uint256 amount, string memory fromBank, string memory toStablecoin, uint256 timestamp) {
        DepositShift memory s = shifts[index];
        return (s.depositor, s.amount, s.fromBank, s.toStablecoin, s.timestamp);
    }
}
