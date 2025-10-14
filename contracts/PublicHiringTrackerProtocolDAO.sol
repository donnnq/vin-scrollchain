// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicHiringTrackerProtocolDAO {
    address public admin;

    struct HiringEntry {
        string agency;
        string position;
        uint256 slots;
        bool posted;
    }

    HiringEntry[] public hiringBoard;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerHiring(string memory _agency, string memory _position, uint256 _slots) external onlyAdmin {
        hiringBoard.push(HiringEntry(_agency, _position, _slots, false));
    }

    function markPosted(uint256 index) external onlyAdmin {
        hiringBoard[index].posted = true;
    }

    function getHiring(uint256 index) external view returns (HiringEntry memory) {
        return hiringBoard[index];
    }
}
