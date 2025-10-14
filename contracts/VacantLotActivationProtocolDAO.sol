// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VacantLotActivationProtocolDAO {
    address public admin;

    struct Lot {
        string location;
        bool activated;
        address developer;
    }

    Lot[] public lots;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitLot(string memory _location, address _developer) external onlyAdmin {
        lots.push(Lot(_location, false, _developer));
    }

    function activateLot(uint256 index) external onlyAdmin {
        Lot storage lot = lots[index];
        require(!lot.activated, "Already activated");
        lot.activated = true;
    }

    function getLot(uint256 index) external view returns (Lot memory) {
        return lots[index];
    }
}
