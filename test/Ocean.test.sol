// SPDX-License-Identifier: MIT
pragma solidity >0.8.20;

import "forge-std/Test.sol";
import "../src/Ocean.sol";

contract OceanTest is Test {
    // Instance the contract
    Ocean ocean;

    function setUp() public {
        ocean = new Ocean(address(this));
    }

    function testName() public {
        assertEq(ocean.name(), "Ocean");
    }

    function testMintNFT() public {
        ocean.safeMint(msg.sender, "https://example.com");
        assertEq(ocean.ownerOf(0), msg.sender);
    }

    // New owner
    function testPurchaseNFT() public {
        address purchaser = address(0x1);
        // send ether to purchase
        vm.startPrank(purchaser);
        vm.expectRevert("Ownable: caller is not the owner");
        ocean.safeMint(purchaser, "https://example.com");
        vm.stopPrank();
    }

    // Test the base URI
    function testBaseURI() public {
        ocean.safeMint(msg.sender, "https://example.com");

        assertEq(ocean.tokenURI(0), "https://example.com");
    }
}
