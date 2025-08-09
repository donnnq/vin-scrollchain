// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title BarangayDAO - Ritual scroll for housing allocation and vertical apartment governance per barangay
/// @author Vinvin
/// @notice Allows citizens to vote on housing, apartment deployment, and urban renewal

contract BarangayDAO {
    address public scrollsmith;

    struct Family {
        bool hasSpouse;
        bool hasChildren;
        bool ownsHouse;
        bool isSquatting;
        bool eligible;
        bool allocated;
    }

    struct Apartment {
        string barangay;
        uint256 unitsAvailable;
        uint256 unitsAllocated;
        bool isDeployed;
    }

    mapping(address => Family) public families;
    mapping(string => Apartment) public apartments;
    mapping(address => string) public allocatedBarangay;

    event FamilyRegistered(address indexed user);
    event ApartmentDeployed(string indexed barangay, uint256 units);
    event HousingAllocated(address indexed user, string barangay);
    event DemolitionScheduled(string indexed barangay);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a family for housing eligibility
    function registerFamily(bool hasSpouse, bool hasChildren, bool ownsHouse, bool isSquatting) external {
        families[msg.sender] = Family({
            hasSpouse: hasSpouse,
            hasChildren: hasChildren,
            ownsHouse: ownsHouse,
            isSquatting: isSquatting,
            eligible: !ownsHouse && (hasSpouse || hasChildren || isSquatting),
            allocated: false
        });
        emit FamilyRegistered(msg.sender);
    }

    /// @notice Deploy vertical apartment units in a barangay
    function deployApartment(string memory barangay, uint256 units) external onlyScrollsmith {
        apartments[barangay] = Apartment({
            barangay: barangay,
            unitsAvailable: units,
            unitsAllocated: 0,
            isDeployed: true
        });
        emit ApartmentDeployed(barangay, units);
    }

    /// @notice Allocate housing to eligible families
    function allocateHousing(string memory barangay) external {
        Family storage fam = families[msg.sender];
        Apartment storage apt = apartments[barangay];

        require(fam.eligible, "Not eligible");
        require(!fam.allocated, "Already allocated");
        require(apt.unitsAvailable > apt.unitsAllocated, "No units left");

        fam.allocated = true;
        apt.unitsAllocated++;
        allocatedBarangay[msg.sender] = barangay;

        emit HousingAllocated(msg.sender, barangay);
    }

    /// @notice Schedule demolition of abandoned informal homes
    function scheduleDemolition(string memory barangay) external onlyScrollsmith {
        emit DemolitionScheduled(barangay);
    }

    /// @notice View apartment status
    function getApartment(string memory barangay) external view returns (Apartment memory) {
        return apartments[barangay];
    }

    /// @notice Check if user has been allocated housing
    function isAllocated(address user) external view returns (bool) {
        return families[user].allocated;
    }
}
