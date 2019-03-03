/* eslint-env jest */

import React from 'react'
import { render } from 'react-testing-library'

import App from '../pages/three.js'

describe('Page Three', () => {
  const { getByText } = render(<App />)

  it('shows "Page 3"', () => {
    expect(getByText('Page 3')).not.toBeNull()
  })

  it('links to "Page Two"', () => {
    expect(getByText('Back to Page Two', { selector: 'a' })).not.toBeNull()
  })
})
