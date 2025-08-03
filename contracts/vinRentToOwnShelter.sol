// SPDX-License-Identifier: Housing-Dignity-Protocol
pragma solidity ^0.8.19;

contract vinRentToOwnShelter {
    address public builder;
    uint256 public totalCost;
    uint256 public monthlyInstallment;
    uint256 public startDate;
    bool public ownershipTransferred;

    struct Occupant {
        uint256 paidAmount;
        bool ownsUnit;
    }

    mapping(address => Occupant) public occupants;

    event PaymentLogged(address indexed occupant, uint256 amount);
    event OwnershipGranted(address indexed occupant);

    modifier onlyBuilder() {
        require(msg.sender == builder, "Sovereign builder only");
        _;
    }

    constructor(uint256 _totalCost, uint256 _installment) {
        builder = msg.sender;
        totalCost = _totalCost;
        monthlyInstallment = _installment;
        startDate = block.timestamp;
    }

    function payInstallment() external payable {
        require(msg.value == monthlyInstallment, "Incorrect installment");
        require(!occupants[msg.sender].ownsUnit, "Already owns unit");

        occupants[msg.sender].paidAmount += msg.value;
        emit PaymentLogged(msg.sender, msg.value);

        if (occupants[msg.sender].paidAmount >= totalCost) {
            occupants[msg.sender].ownsUnit = true;
            ownershipTransferred = true;
            emit OwnershipGranted(msg.sender);
        }
    }

    function checkStatus(address occupant) external view returns (string memory status) {
        if (occupants[occupant].ownsUnit) {
            status = "🏠 Unit fully owned—congrats sa bagong tahanan!";
        } else {
            uint256 remaining = totalCost - occupants[occupant].paidAmount;
            status = string(abi.encodePacked("💸 Remaining balance: ", uint2str(remaining), " wei"));
        }
    }

    function uint2str(uint256 _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 len;
        while (j != 0) { len++; j /= 10; }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        while (_i != 0) { k--; bstr[k] = bytes1(uint8(48 + _i % 10)); _i /= 10; }
        return string(bstr);
    }
}
