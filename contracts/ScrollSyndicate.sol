// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ScrollSyndicate
/// @notice Manage enterprise collaborations, share issuance, and branded logos
contract ScrollSyndicate {
    address public owner;

    struct Enterprise {
        string name;
        string logoURI;
        uint256 sharesIssued;
        uint256 sharePrice;
        bool active;
    }

    uint256 public nextEnterpriseId;
    mapping(uint256 => Enterprise) public enterprises;
    mapping(uint256 => mapping(address => uint256)) public sharesOwned;

    event EnterpriseCreated(
        uint256 indexed id,
        string name,
        string logoURI,
        uint256 sharePrice
    );
    event SharesPurchased(uint256 indexed id, address indexed buyer, uint256 qty);
    event EnterpriseStatusChanged(uint256 indexed id, bool active);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Create a new enterprise with logo and share price
    function createEnterprise(
        string calldata name,
        string calldata logoURI,
        uint256 sharePrice
    ) external onlyOwner {
        enterprises[nextEnterpriseId] = Enterprise(
            name,
            logoURI,
            0,
            sharePrice,
            true
        );
        emit EnterpriseCreated(nextEnterpriseId, name, logoURI, sharePrice);
        nextEnterpriseId++;
    }

    /// @notice Purchase a quantity of shares for a given enterprise
    function purchaseShares(uint256 id, uint256 quantity) external payable {
        Enterprise storage e = enterprises[id];
        require(e.active, "Enterprise inactive");
        require(msg.value == e.sharePrice * quantity, "Incorrect payment");

        e.sharesIssued += quantity;
        sharesOwned[id][msg.sender] += quantity;
        payable(owner).transfer(msg.value);

        emit SharesPurchased(id, msg.sender, quantity);
    }

    /// @notice Activate or deactivate an enterprise
    function changeStatus(uint256 id, bool active) external onlyOwner {
        enterprises[id].active = active;
        emit EnterpriseStatusChanged(id, active);
    }

    /// @notice Check how many shares you own in an enterprise
    function getMyShares(uint256 id, address user)
        external
        view
        returns (uint256)
    {
        return sharesOwned[id][user];
    }
}
