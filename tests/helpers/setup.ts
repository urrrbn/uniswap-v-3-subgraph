import { clearStore } from "matchstick-as/assembly/index"

// Test setup helper - call before each test
export function beforeEach(): void {
  clearStore()
}

// Test cleanup helper - call after each test if needed
export function afterEach(): void {
  // Additional cleanup can be added here if needed
}

// Global test setup - call before all tests
export function beforeAll(): void {
  // Global setup if needed
}

// Global test cleanup - call after all tests
export function afterAll(): void {
  clearStore()
} 