// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title vinFlexWhistle.sol
/// @notice Enables anonymous reporting of civic violations by fake agencies.

contract vinFlexWhistle {
    address public admin;
    uint256 public reportCount;

    struct Tip {
        uint256 id;
        string category;
        string description;
        uint256 timestamp;
    }

    mapping(uint256 => Tip) public tips;

    event TipSubmitted(uint256 indexed id, string category);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized.");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function submitTip(string memory _category, string memory _description) public {
        reportCount += 1;
        tips[reportCount] = Tip(reportCount, _category, _description, block.timestamp);
        emit TipSubmitted(reportCount, _category);
    }

    function viewTip(uint256 _id) public view returns (Tip memory) {
        return tips[_id];
    }
}
