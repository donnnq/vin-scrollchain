// SPDX-License-Identifier: HUMANITY
pragma solidity ^0.8.25;

/// @title vin-EmpathyToken.sol
/// @notice Mints tokens for verified acts of kindness within the ecosystem.
contract EmpathyToken {

    address public empathyOracle;
    string public kindnessCode = "KALINGA";
    uint256 public totalMinted;

    mapping(address => uint256) public empathyBalance;

    event KindnessMinted(address indexed doer, string deed, uint256 amount);

    modifier onlyOracle() {
        require(msg.sender == empathyOracle, "Only the Empathy Oracle can mint.");
        _;
    }

    constructor() {
        empathyOracle = msg.sender;
    }

    /// @notice Mint tokens for a kindness deed
    function mintKindness(address doer, string memory deed, uint256 amount) public onlyOracle {
        empathyBalance[doer] += amount;
        totalMinted += amount;
        emit KindnessMinted(doer, deed, amount);
    }

    /// @notice View empathy tokens for a citizen
    function balanceOf(address citizen) public view returns (uint256) {
        return empathyBalance[citizen];
    }
}
